Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  resources :recipes, only: [:show, :index]
  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
    resources :recipes, except: [:show, :index]
    resources :recipe_attachments
    resources :categories, except: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
