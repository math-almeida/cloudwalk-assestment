class RepositoriesSerializer
  private attr_accessor :repositories
  def initialize(repositories)
    self.repositories = repositories
  end

  BuildRepository = ->(repo){ { id: repo.id, name: repo.name, stars: repo.stars, url: repo.url, user: repo.user.username } }

  def as_json
    repositories.map(&BuildRepository)
  end
end
