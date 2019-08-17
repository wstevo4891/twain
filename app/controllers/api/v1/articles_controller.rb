# app/controllers/api/v1/articles_controller.rb

# frozen_string_literal: true

module Api
  module V1
    # API Controller for articles
    class ArticlesController < ApplicationController
      ##
      # GET /api/v1/articles/:slug
      #
      def show
        @article = Article.find_by(slug: params[:slug])
      end
    end
  end
end
