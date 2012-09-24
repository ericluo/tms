# -*- coding: utf-8 -*-
class TrainsController < ApplicationController

  load_and_authorize_resource 
  add_breadcrumb("学分管理", "trains_path")
  add_breadcrumb("我的学分", "trains_path", only: [:index])
  add_breadcrumb("我的登记簿", "register_trains_path", only: [:register])
  add_breadcrumb("学分登记", '', only: [:new, :create])
  add_breadcrumb("信息修订", '', only: [:edit, :update])
  
  # GET /trains
  # GET /trains.json
  def index
    template = "index"
    case params[:v]
    when 'trainee'
      @trains = @trains.owned_by(current_user).approved
      template = "index_for_trainee"
    when 'registrar'
      @trains = @trains.registed_by(current_user)
      template = "index_for_registrar"
    when 'approve'
      template = "index_for_approve"
    end
    
    respond_to do |format|
      format.html { render template }
      format.json { render json: @trains }
      format.csv {send_data Train.to_csv}
      format.xls
    end
  end

  def search
    @trains = Train.unapproved
  end
  
  def register
    @trains = @trains.where(registrar_id: current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trains }
      format.csv {send_data Train.to_csv}
      format.xls
    end
  end

  # GET /trains/1
  # GET /trains/1.json
  def show
    add_breadcrumb(@train.name)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @train }
    end
  end

  # GET /trains/new
  # GET /trains/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @train }
    end
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  # POST /trains.json
  def create
    @train.registrar = current_user

    respond_to do |format|
      if @train.save
        format.html { redirect_to @train, notice: '培训学分录入成功' }
        format.json { render json: @train, status: :created, location: @train }
      else
        format.html { render action: "new" }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trains/1
  # PUT /trains/1.json
  def update
    @train = Train.find(params[:id])
    @train.approved = nil

    respond_to do |format|
      if @train.update_attributes(params[:train])
        format.html { redirect_to @train, notice: '培训学分更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trains/1
  # DELETE /trains/1.json
  def destroy
    @train = Train.find(params[:id])
    @train.destroy

    respond_to do |format|
      format.html { redirect_to trains_url }
      format.json { head :no_content }
    end
  end

  def approve
    @train = Train.find(params[:id])
    @train.approved = params[:approved]

    message = @train.save ? '培训学分审核成功' : '培训学分审核失败'
    redirect_to search_trains_url, notice: message
  end
  
end

  
