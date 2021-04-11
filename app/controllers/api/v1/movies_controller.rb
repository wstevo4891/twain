# app/controllers/api/v1/movies_controller.rb

# frozen_string_literal: true

module Api
  module V1
    # API Controller for movies
    class MoviesController < ApplicationController
      skip_before_action :verify_authenticity_token

      ##
      # GET /api/v1/movies
      #
      def index
        @movies = Movie.all
      end

      ##
      # GET /api/v1/movies/:id
      #
      def show
        @movie = Movie.find(params[:id])
      end

      ##
      # POST /api/v1/movies/search
      #
      def search
        @movies = Movie.where(title: params[:titles])
      end
    end
  end
end
