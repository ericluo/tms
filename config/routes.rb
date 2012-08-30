Tms::Application.routes.draw do
  resources :in_job_train_catalogs

  resources :trains

  resources :departments

  # authenticated :user do
  #   root :to => 'home#index'
  # end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
