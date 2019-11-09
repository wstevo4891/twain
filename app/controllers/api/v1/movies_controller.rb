# app/controllers/api/v1/movies_controller.rb

# frozen_string_literal: true

module Api
  module V1
    # API Controller for movies
    class MoviesController < ApplicationController
      ##
      # GET /api/v1/movies
      #
      def index
        render json: Movie.all
      end

      ##
      # GET /api/v1/movies/:slug
      #
      def show
        render json: Movie.find_by(slug: params[:slug])
      end
    end
  end
end
