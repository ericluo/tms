class TrainCategoriesController < ApplicationController
  # GET /train_categories
  # GET /train_categories.json
  def index
    @train_categories = TrainCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @train_categories }
    end
  end

  # GET /train_categories/1
  # GET /train_categories/1.json
  def show
    @train_category = TrainCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @train_category }
    end
  end

  # GET /train_categories/new
  # GET /train_categories/new.json
  def new
    @train_category = TrainCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @train_category }
    end
  end

  # GET /train_categories/1/edit
  def edit
    @train_category = TrainCategory.find(params[:id])
  end

  # POST /train_categories
  # POST /train_categories.json
  def create
    @train_category = TrainCategory.new(params[:train_category])

    respond_to do |format|
      if @train_category.save
        format.html { redirect_to @train_category, notice: 'Train category was successfully created.' }
        format.json { render json: @train_category, status: :created, location: @train_category }
      else
        format.html { render action: "new" }
        format.json { render json: @train_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /train_categories/1
  # PUT /train_categories/1.json
  def update
    @train_category = TrainCategory.find(params[:id])

    respond_to do |format|
      if @train_category.update_attributes(params[:train_category])
        format.html { redirect_to @train_category, notice: 'Train category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @train_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /train_categories/1
  # DELETE /train_categories/1.json
  def destroy
    @train_category = TrainCategory.find(params[:id])
    @train_category.destroy

    respond_to do |format|
      format.html { redirect_to train_categories_url }
      format.json { head :no_content }
    end
  end
end
