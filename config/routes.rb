Rails.application.routes.draw do
  devise_for :users
  resources :genres, only: %i(show)
  resources :media, only: %i(show)
  root to: 'welcome#index'
end
