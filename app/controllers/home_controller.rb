class HomeController < ApplicationController
  skip_authorization_check
  skip_before_filter :authenticate_user!
  
  def index
    # unless user_signed_in?
    #   render "devise/sessions/new", layout: false
    # end
    # binding.pry_remote # demo for pow web server
  end
end
