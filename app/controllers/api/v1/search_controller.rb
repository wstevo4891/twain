# app/controllers/api/v1/search_controller.rb

module Api
  module V1
    # Controller for /api/search route
    class SearchController < ApplicationController
      def show
        @results = SearchResults.create(params[:query])
      end
    end
  end
end
