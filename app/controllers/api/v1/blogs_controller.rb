# app/controllers/api/v1/blogs_controller.rb

# frozen_string_literal: true

module Api
  module V1
    # API Controller for blogs
    class BlogsController < ApplicationController
      # GET /api/blogs
      def index
        @blogs = Blog.all
      end

      # GET /api/blogs/:slug
      def show
        @blog = Blog.find_by(slug: params[:slug])
      end
    end
  end
end
