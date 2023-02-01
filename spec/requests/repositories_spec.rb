require 'rails_helper'

RSpec.describe RepositoriesController, type: :request do
  describe 'POST create' do
    it 'should call perform_async on CreateRepositoryWorker' do
      expect {
        post repositories_path, params:{ username: 'math-almeida' }
      }.to change(CreateRepositoryWorker.jobs, :size).by(1)
    end

    it 'returns a success response' do
      post repositories_path
      expect(response).to be_successful
    end
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get repositories_path
      expect(response).to be_successful
    end
  end
end
