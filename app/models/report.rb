# -*- coding: utf-8 -*-
class Report < ActiveRecord::Base
  validates :start_date, :end_date, presence: true
  
  attr_accessible :content, :end_date, :start_date, :title
  attr_accessible :category

  ScoreRank = Struct.new(:department, :name, :position, :score, :rank)

  def rank_list
    data = []

    Department.order("id ASC").each do |d|
      d.users.order("position_id ASC").each do |u|
        data << ScoreRank.new(d.name, u.name, u.position.name, u.total_score)
      end
    end

    scores = data.collect(&:score).sort{|a,b| b <=> a}
    data.each do |r|
      r.rank = scores.find_index(r.score) + 1
    end
    
  end

end
