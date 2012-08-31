# coding: utf-8
class UsersController < ApplicationController
  add_breadcrumb("用户管理", "users_path")
  before_filter :authenticate_user!
  
  def index
    authorize! :index, current_user, :message => '您无权限使用该功能'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
