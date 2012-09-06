class Users::PasswordsController < ApplicationControllerb
  skip_authorization_check
  skip_before_filter :require_no_authentication
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.reset_password!(params[:new_password], params[:new_password_confirmation])
      redirect_to root_url
    else
      render :edit
    end
    
  end
end
