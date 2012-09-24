# coding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource 

  add_breadcrumb("用户管理", "users_path")
  add_breadcrumb("用户注册", "new_admin_registration", only: [:new, :create])
  add_breadcrumb("用户编辑", "edit_admin_registration", only: [:edit, :update])

  def index
    # binding.remote_pry
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_url, notice: '新建用户成功'
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update_password
    
    @user = current_user
    if @user.update_attributes(params[:user])
      sign_in @user, bypass: true
      redirect_to trains_path
    else
      render :edit
    end
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:password].empty? and params[:user][:password_confirmation].empty?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.update_attributes(params[:user])
      # sign_in @user, bypass: true
      redirect_to users_url, notice: '更新用户成功'
    else
      render :edit
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
end
