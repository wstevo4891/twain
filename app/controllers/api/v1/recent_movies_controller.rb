# app/controllers/api/v1/recent_movies_controller.rb

# frozen_string_literal: true

module Api
  module V1
    # API Controller for recent movies
    class RecentMoviesController < ApplicationController
      ##
      # GET /api/v1/recent-movies
      #
      def index
        render json: Movie.recent
      end
    end
  end
end
