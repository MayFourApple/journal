Rails.application.routes.draw do
  devise_for :users

  # resource :categories, only: [:index] do
  #   collection do
  #     get :auth
  #   end  
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/category' => 'category#index'
  # get '/categories/new' => 'categories#new', as: 'new_category'
  # post '/categories' => 'categories#create', as: 'create_category'

  root to: "categories#index"

  resources :categories do
    resources :tasks
  end
end
