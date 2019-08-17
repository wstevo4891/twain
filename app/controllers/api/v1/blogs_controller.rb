# app/controllers/api/v1/blogs_controller.rb

# frozen_string_literal: true

module Api
  module V1
    # API Controller for blogs
    class BlogsController < ApplicationController
      ##
      # GET /api/v1/blogs
      #
      def index
        @blogs = Blog.all
      end

      ##
      # GET /api/v1/blogs/:slug
      #
      def show
        @blog = Blog.find_by(slug: params[:slug])
      end
    end
  end
end
