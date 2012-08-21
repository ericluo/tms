class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, current_user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
