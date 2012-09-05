# -*- coding: utf-8 -*-
class PositionsController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb("职位管理", "positions_path")
  add_breadcrumb("新增职位", '', only: [:new, :create])
  add_breadcrumb("职位修订", '', only: [:edit, :update])

  def index
    @positons = Position.all
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(params[:position])
    if @position.save
      redirect_to positions_url, notice: "新建职位成功"
    else
      render :new
    end
    
  end

  def edit
    @position = Position.find(params[:id])
  end
      
  def update
    @position = Position.find(params[:id])
    if @position.update_attributes(params[:department])
      redirect_to positions_url, notice: '更新职位成功'
    else
      render :edit
    end
  end
  
  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    redirect_to positions_url
  end
  
end
