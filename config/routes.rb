Rails.application.routes.draw do
  resources :selectors
  resources :sources
  resources :products
  resources :reviews
  root 'sources#index'
end
