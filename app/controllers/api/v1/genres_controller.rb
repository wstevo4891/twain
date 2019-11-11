# app/controllers/api/v1/genres_controller.rb

# frozen_string_literal: true

module Api
  module V1
    # API Controller for genres
    class GenresController < ApplicationController
      ##
      # GET /api/v1/genres
      #
      def index
        @genres = Genre.all
      end

      ##
      # GET /api/v1/genres/:slug
      #
      def show
        @results = genre_results
      end

      private

      def genre_results
        genre = Genre.find_by(slug: params[:slug])

        { genre: genre, movies: genre.movies }
      end
    end
  end
end
