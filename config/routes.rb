Rails.application.routes.draw do

  root  "jobs#index"
  
  resources :boats
  
  get "/signin" => "sessions#new"
  post "/signin" => "users#signin"
  post "/logout" => "sessions#destroy"
  
  resources :users
  
  resources :jobs
  
end