##
# @file config/routes.rb
#
# @description Application routes config
#
Rails.application.routes.draw do
  # root to: 'home#index'

  # ===========================================================================
  # ActiveRecord Resources
  # ===========================================================================
  resources :articles
  resources :projects
end
