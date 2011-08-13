PhoneLog::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  root :to => 'logs#index'
  resources :logs
  resources :reports
  match '/log_search' => 'logs#search'
end
