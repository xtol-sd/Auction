Auction::Application.routes.draw do
  resources :donations

  resources :bids

  resources :items

  authenticated :user do
    root :to => 'items#index'
  end
  root :to => "items#index"
  devise_for :users
  resources :users
end