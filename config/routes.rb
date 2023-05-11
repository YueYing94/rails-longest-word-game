Rails.application.routes.draw do
  get "/new", to: "pages#new"
  post "/score", to: "pages#score"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
