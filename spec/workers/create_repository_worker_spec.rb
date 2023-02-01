require 'rails_helper'
require 'webmock/rspec'

RSpec.describe CreateRepositoryWorker, type: :worker do
  describe '#perform' do
    let(:username) { 'math-almeida' }
    let(:repo) do
      {
        name: 'Example',
        html_url: 'https://github.com/math-almeida/teste',
        stargazers_count: 25
      }
    end

    before do
      stub_request(:get, 'https://api.github.com/users/math-almeida/repos?page=1')
        .to_return(status: 200, body: [repo].to_json, headers: {})
      stub_request(:get, 'https://api.github.com/users/math-almeida/repos?page=2')
        .to_return(status: 200, body: [].to_json, headers: {})
    end

    it 'find or create a user object' do
      expect {
        CreateRepositoryWorker.perform_async(username)
        Sidekiq::Worker.drain_all
      }.to change(User, :count).by(1)
    end

    it 'find or create a repository object' do
      expect {
        CreateRepositoryWorker.perform_async(username)
        Sidekiq::Worker.drain_all
      }.to change(Repository, :count).by(1)
    end

    it 'makes a request to github api' do
      CreateRepositoryWorker.perform_async(username)
      Sidekiq::Worker.drain_all
      assert_requested :get, 'https://api.github.com/users/math-almeida/repos?page=1', times: 1
    end
  end
end
