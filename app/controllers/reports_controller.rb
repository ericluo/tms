# -*- coding: utf-8 -*-
class ReportsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  add_breadcrumb("报表管理", "reports_path")
  add_breadcrumb("生成报表", '', only: [:new, :create])
  add_breadcrumb("信息修订", '', only: [:edit, :update])
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xls {send_data @report.content, filename: report_file_name(@report) }
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def create
    @report = Report.new(params[:report])

    template_file = case @report.category
                    when "学分排名" then "score_rank.xls.erb"
                    when "学分明细" then "score_detail.xls.erb"
                    end
    rhtml = ERB.new(File.read(Rails.root.join("app/views/reports/#{template_file}")))
    @trains = Train.all
    @users = User.all
    @report.content = rhtml.result(binding)
    
    respond_to do |format|
      if @report.save
        format.html { redirect_to reports_url, notice: '新增报表成功' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  def report_file_name(report)
    "#{report.id}_#{report.start_date}_#{report.category}.xls"
  end

end
