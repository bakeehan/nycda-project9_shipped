Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/signin" => "sessions#new"
  post "/signin" => "users#signin"
  post "/logout" => "sessions#destroy"
  

  resources :users
end
