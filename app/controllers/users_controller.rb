# coding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  add_breadcrumb("用户管理", "users_path")
  add_breadcrumb("用户注册", "new_admin_registration", only: [:new, :create])
  add_breadcrumb("用户编辑", "edit_admin_registration", only: [:edit, :update])

  def index

  end

  def new
    @user = User.new
  end

  def create

  end
  
  def edit
  end

  def update
  end
  
  def show
  end

  def update
    # if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    #   params[:user].delete(:password)
    #   params[:user].delete(:password_confirmation)
    # end
    # if @user.update_attributes(params[:user])
    #   flash[:notice] = "更新用户成功,请重新登录系统"
    #   sign_out :user
    #   redirect_to root_url
    # else
    #   render :edit
    # end
  end

end
