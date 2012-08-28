class InJobTrainCatalogsController < ApplicationController
  # GET /in_job_train_catalogs
  # GET /in_job_train_catalogs.json
  def index
    @in_job_train_catalogs = InJobTrainCatalog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @in_job_train_catalogs }
    end
  end

  # GET /in_job_train_catalogs/1
  # GET /in_job_train_catalogs/1.json
  def show
    @in_job_train_catalog = InJobTrainCatalog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @in_job_train_catalog }
    end
  end

  # GET /in_job_train_catalogs/new
  # GET /in_job_train_catalogs/new.json
  def new
    @in_job_train_catalog = InJobTrainCatalog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @in_job_train_catalog }
    end
  end

  # GET /in_job_train_catalogs/1/edit
  def edit
    @in_job_train_catalog = InJobTrainCatalog.find(params[:id])
  end

  # POST /in_job_train_catalogs
  # POST /in_job_train_catalogs.json
  def create
    @in_job_train_catalog = InJobTrainCatalog.new(params[:in_job_train_catalog])

    respond_to do |format|
      if @in_job_train_catalog.save
        format.html { redirect_to @in_job_train_catalog, notice: 'In job train catalog was successfully created.' }
        format.json { render json: @in_job_train_catalog, status: :created, location: @in_job_train_catalog }
      else
        format.html { render action: "new" }
        format.json { render json: @in_job_train_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /in_job_train_catalogs/1
  # PUT /in_job_train_catalogs/1.json
  def update
    @in_job_train_catalog = InJobTrainCatalog.find(params[:id])

    respond_to do |format|
      if @in_job_train_catalog.update_attributes(params[:in_job_train_catalog])
        format.html { redirect_to @in_job_train_catalog, notice: 'In job train catalog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @in_job_train_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_job_train_catalogs/1
  # DELETE /in_job_train_catalogs/1.json
  def destroy
    @in_job_train_catalog = InJobTrainCatalog.find(params[:id])
    @in_job_train_catalog.destroy

    respond_to do |format|
      format.html { redirect_to in_job_train_catalogs_url }
      format.json { head :no_content }
    end
  end
end
