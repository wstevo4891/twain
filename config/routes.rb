# frozen_string_literal: true

##
# @file config/routes.rb
#
# @description Application routes config
#
Rails.application.routes.draw do
  root to: 'home#index'

  # ===========================================================================
  # ActiveRecord Resources
  # ===========================================================================
  resources :articles, :blogs, :projects

  # ===========================================================================
  # API
  # ===========================================================================
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Articles index
      get '/articles', to: 'articles#index'

      # Articles show
      get '/articles/:slug', to: 'articles#show', as: :article

      # Blogs index
      get '/blogs', to: 'blogs#index'

      # Blogs show
      get '/blogs/:slug', to: 'blogs#show', as: :blog

      # Projects index
      get '/projects', to: 'projects#index'

      # Projects show
      get '/projects/:slug', to: 'projects#show', as: :project
    end
  end

  # ===========================================================================
  # Dashboards
  # ===========================================================================
  get '/api/dashboard', to: 'api/dashboard#index'

  get '/api/data/:model', to: 'api/data#index'

  post '/api/data', to: 'api/data#show'
end
