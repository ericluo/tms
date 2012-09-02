# coding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb("用户管理", "users_path")
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
