Tms::Application.routes.draw do
  resources :trains

  resources :departments

  authenticated :user, lambda {|u| u.has_role?("admin")} do
    root :to => 'trains#index'
  end

  unauthenticated :user do
    root :to => "trains#index"
  end
  
  # root :to => "home#index"
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :users, :only => [:show, :index]
end
