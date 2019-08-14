# app/controllers/api/v1/projects_controller.rb

# frozen_string_literal: true

module Api
  module V1
    # API Controller for projects
    class ProjectsController < ApplicationController
      # GET /api/projects
      def index
        @projects = Project.all
      end

      # GET /api/projects/:slug
      def show
        @project = Project.find_by(slug: params[:slug])
      end
    end
  end
end
