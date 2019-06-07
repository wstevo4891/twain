# app/controllers/api/projects_controller.rb

module Api
  class ProjectsController < ApplicationController
    # GET /api/projects
    def index
      @projects = Project.all

      render json: @projects, status: :ok
    end

    # GET /api/projects/:slug
    def show
      @project = Project.find_by(slug: params[:slug])

      render json: @project, status: :ok
    end
  end
end
