# frozen_string_literal: true

##
# @file config/routes.rb
#
# @description Application routes config
#
Rails.application.routes.draw do
  resources :regions
  resources :roles
  resources :locations
  resources :people
  root to: 'home#index'

  # ===========================================================================
  # ActiveRecord Resources
  # ===========================================================================
  resources :articles, :blogs, :projects, :movies, :genres, :sub_genres

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

      # Movies index
      get '/movies', to: 'movies#index'

      # Movies show
      get '/movies/:slug', to: 'movies#show', as: :movie

      # Genres index
      get '/genres', to: 'genres#index'

      # Genres show
      get '/genres/:slug', to: 'genres#show', as: :genre
    end
  end

  # ===========================================================================
  # Dashboards
  # ===========================================================================
  get '/api/dashboard', to: 'api/dashboard#index'

  get '/api/data/:model', to: 'api/data#index'

  post '/api/data', to: 'api/data#show'
end
