# -*- coding: utf-8 -*-
class Report < ActiveRecord::Base
  validates :start_date, :end_date, presence: true
  
  attr_accessible :content, :end_date, :start_date, :title
  attr_accessible :category

  def score_rank

  end
  
end
