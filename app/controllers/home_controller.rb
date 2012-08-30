class HomeController < ApplicationController
  def index
    unless user_signed_in?
      render "shared/login"
    end
    # binding.pry_remote # demo for pow web server
  end
end
