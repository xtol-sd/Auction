Auction::Application.routes.draw do
  resources :events


  resources :donations

  resources :bids

  resources :items

  authenticated :user do
    root :to => 'items#index'
  end
  root :to => "items#index"
  devise_for :users
  resources :users
  get "my_bids" => "items#my_bids", :as => "_my_bids"
end