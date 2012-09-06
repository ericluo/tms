# coding: utf-8

class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, only: [:new, :create, :cancel]
  skip_before_filter :require_no_authentication

  add_breadcrumb("用户管理", "users_path")
  add_breadcrumb("用户注册", "new_user_registration", only: [:new, :create])
  add_breadcrumb("用户编辑", "edit_user_registration", only: [:edit, :update])
  def check_permissions
    authorize! :create, resource
  end

end
