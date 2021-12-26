Rails.application.routes.draw do
  resources :recipes, only: [:show, :index]
  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
    resources :recipes, except: [:show, :index]
    resources :recipe_attachments
    resources :categories, except: [:show]
  end
  root 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
