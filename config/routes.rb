Rails.application.routes.draw do
  root "pins#index"
  devise_for :users

  resources :pins do
    collection do
      get 'search'
    end
    member do
      put "Lile", to: "pins#upvote"
    end
  end

  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
    resources :pins, except: [:show, :index]
    resources :categories, except: [:show]
  end

  get ':username' => 'users#show', as: 'user'
end
