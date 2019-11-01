Rails.application.routes.draw do
  get 'root' to: 'kittens#index'  
  resources :kittens
end
