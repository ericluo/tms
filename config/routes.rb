Tms::Application.routes.draw do
  resources :roles

  resources :report_definitions

  resources :reports

  resources :trains do
    collection do
      get 'register'
      get 'search'
    end
  end

  resources :departments, :categories, :positions

  # authenticated :user, lambda {|u| u.has_role?("admin")} do
  #   root :to => 'trains#index'
  # end

  root :to => "home#index"

  resources :users
  devise_for :users

end
