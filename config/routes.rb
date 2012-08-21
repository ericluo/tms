Tms::Application.routes.draw do
  resources :train_categories

  resources :trains

  resources :departments

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
