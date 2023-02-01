class RepositoriesController < ApplicationController
  def create
    CreateRepositoryWorker.perform_async(params[:username])
    render json: { message: 'Created' }
  end

  def index
    render json: RepositoriesSerializer.new(Repository.all).as_json
  end

  private

  def repository_params
    params.permit(:username)
  end
end
