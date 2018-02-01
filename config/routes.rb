Rails.application.routes.draw do
  devise_for :users
  resources :genres, only: %i(show)
  resources :media, only: %i(show)
  resources :inquiries, only: %i(new create)
  root to: 'welcome#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/lo'
  end
end
