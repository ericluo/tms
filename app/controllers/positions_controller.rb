class PositionsController < ApplicationController

  load_and_authorize_resource

  def index
    @positons = Position.all
  end
end
