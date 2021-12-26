Rails.application.routes.draw do
  resources :recipe_attachments
  resources :recipes
  resources :tags, only: [:show]
  resources :categories
  root 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
