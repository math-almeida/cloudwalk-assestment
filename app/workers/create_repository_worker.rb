class CreateRepositoryWorker
  require 'net/http'
  require 'uri'

  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(username)
    @user = User.where(username:).first_or_create
    page = 1

    loop do
      uri = URI.parse("https://api.github.com/users/#{username}/repos?page=#{page}")
      response = Net::HTTP.get_response(uri)
      body = JSON.parse(response.body)
      break if body.empty?

      repos = body.map{ |repo| { name: repo['name'], stars: repo['stargazers_count'], url: repo['html_url'] } }
      repos.each do |repo|
        @repository = Repository.find_or_initialize_by(user_id: @user.id, name: repo[:name], url: repo[:url])
        @repository.stars = repo[:stars]
        @repository.save
      end
      page += 1
    end
  end
end
