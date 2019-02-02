Rails.application.routes.draw do
  
  root to: 'lists#index'

  resources :lists do
    member do
      patch :move
    end
  end
  resources :cards

end
