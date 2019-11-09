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
  resources :articles, :blogs, :projects, :movies, :genres, :sub_genres,
            :regions, :roles, :locations, :people

  # ===========================================================================
  # API
  # ===========================================================================
  namespace :api do
    namespace :v1, defaults: { format: :json } do
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

      # Recent Movies
      get '/recent-movies', to: 'recent_movies#index', as: :recent_movies

      # Movies Index for Bolt Network sliders
      get '/movies-index/:slide_length', to: 'movies_index#show'

      # Genres index
      get '/genres', to: 'genres#index'

      # Genres show
      get '/genres/:slug', to: 'genres#show', as: :genre

      # Search Genres and Movies
      get '/search/:query', to: 'search#show', as: :search
    end
  end

  # ===========================================================================
  # Dashboards
  # ===========================================================================
  get '/api/dashboard', to: 'api/dashboard#index'

  get '/api/data/:model', to: 'api/data#index'

  post '/api/data', to: 'api/data#show'
end
