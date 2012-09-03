# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  check_authorization unless: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_path
    # redirect_to root_path, :alert => exception.message
  end

  def add_breadcrumb(title, url = '')
    @breadcrumbs ||= [["首页", root_path]]
    url = eval(url) if url =~ /_path|_url|@/
    @breadcrumbs << [title, url]
  end
  
  def self.add_breadcrumb(title, url, options = {})
    before_filter options do |controller|
      controller.send(:add_breadcrumb, title, url)
    end
  end
  
end
