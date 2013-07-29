Auction::Application.routes.draw do
  resources :events do
    resources :items
  end

  resources :donations

  resources :bids

  root :to => "events#show"

  devise_for :users
  resources :users

  get "my_bids" => "items#my_bids", :as => "_my_bids"
  get "my_donations" => "items#my_donations", :as => "_my_donations"
  get "admin_approval" => "donations#index", :as => "admin_approval"
  get "dashboard" => "events#index", :as => "dashboard"
  get "dashboard/report1" => "events#report1", :as => "dashboard_report1"
  get "dashboard/report2" => "events#report2", :as => "dashboard_report2"
  
end