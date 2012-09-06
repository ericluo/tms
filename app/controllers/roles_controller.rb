class RolesController < ApplicationController
  before_filter :authenticate_user!
end
