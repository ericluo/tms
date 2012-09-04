Tms::Application.routes.draw do
  resources :trains do
    collection do
      get 'register'
      get 'search'
    end
  end

  resources :departments, :categories, :positions

  authenticated :user, lambda {|u| u.has_role?("admin")} do
    root :to => 'trains#index'
  end

  root :to => "home#index"
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :users, :only => [:show, :index]
end
