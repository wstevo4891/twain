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
        render json: Genre.all
      end

      ##
      # GET /api/v1/genres/:slug
      #
      def show
        render json: Genre.find_by(slug: params[:slug])
      end
    end
  end
end
