# -*- coding: utf-8 -*-
class Report < ActiveRecord::Base
  validates :start_date, :end_date, presence: true
  
  attr_accessible :content, :end_date, :start_date, :title

  TYPES = %w[学分排名 学分明细 总体情况]

  belongs_to :report_definition
end
