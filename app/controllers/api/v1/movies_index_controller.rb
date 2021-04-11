# app/controllers/api/v1/movies_index_controller.rb

module Api
  module V1
    # Movies Index API
    # Route for fetching an object of movies indexed by genre
    class MoviesIndexController < ApplicationController
      def index
        @movies_index = Movie.index_by_genre
      end
    end
  end
end
