# -*- coding: utf-8 -*-
class Report < ActiveRecord::Base
  validates :start_date, :end_date, presence: true
  
  attr_accessible :content, :end_date, :start_date, :title
  attr_accessible :report_definition_id

  belongs_to :report_definition
end
