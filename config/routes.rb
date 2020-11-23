Rails.application.routes.draw do
  devise_for :users


  resources :pins do
    collection do
      get 'search'
    end
    member do
      put "Lile", to: "pins#upvote"
      put :new_status, as: :new_status
    end
  end


  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
    resources :categories, except: [:show]
  end

  get ':username' => 'users#show', as: 'user'
  get 'users/:id/pins' => 'users#index', :as => :user_pins
  # patch 'pins/:id/new_status' => 'pins#new_status', :as => :new_status

  root "pins#index"
end
