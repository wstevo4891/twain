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
  resources :articles
  resources :blogs
  resources :projects

  # ===========================================================================
  # API Routes
  # ===========================================================================
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Articles show
      get '/article/:slug', to: 'articles#show'

      # Blogs index
      get '/blogs', to: 'blogs#index'

      get '/blogs/:slug', to: 'blogs#show'

      # Projects index
      get '/projects', to: 'projects#index'

      # Projects show
      get '/projects/:slug', to: 'projects#show'
    end
  end
end
