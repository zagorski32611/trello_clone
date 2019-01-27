Rails.application.routes.draw do
  resources :cards
  resources :lists
  

  root to: 'lists#index'
end
