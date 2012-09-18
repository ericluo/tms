Tms::Application.routes.draw do
  resources :roles

  resources :report_definitions

  resources :reports

  resources :trains do
    collection do
      get 'register'
      get 'search'
    end

    member do
      put 'approve'
    end
    
  end

  resources :departments, :categories, :positions

  # authenticated :user, lambda {|u| u.has_role?("admin")} do
  #   root :to => 'trains#index'
  # end

  root :to => "home#index"

  devise_for :users

  resources :users do
    member do
      put 'update_password'
    end
  end

end
