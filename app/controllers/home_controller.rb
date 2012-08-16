class HomeController < ApplicationController
  def index
    @users = User.all
    # binding.pry_remote # demo for pow web server
  end
end
