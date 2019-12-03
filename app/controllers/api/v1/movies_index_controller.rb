# app/controllers/api/v1/movies_index_controller.rb

module Api
  module V1
    # Movies Index API
    # Route for fetching an object of movies indexed by genre
    class MoviesIndexController < ApplicationController
      def index
        @movies_index = MoviesIndex.build
      end

      def show
        @movies_index = MoviesIndex.build(params[:slide_length])
      end
    end
  end
end
