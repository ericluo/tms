# -*- coding: utf-8 -*-
class Train < ActiveRecord::Base

  belongs_to :category
  belongs_to :trainee, class_name: "User"
  belongs_to :registrar, class_name: "User"
  
  attr_accessible :name, :start_date, :end_date, :comment
  attr_accessible :score, :period, :organizer
  attr_accessible :category_id, :trainee_id, :registrar_id
  # attr_accessible :certificate
  attr_accessor :scoring_rule

  def scoring_rule
    case category.name
    when "脱产培训" then ScoringRule::OffJobTrain
    # when "讲座培训": then ScoringRule::LectureTrain
    # when "在岗培训": then ScoringRule::InJobTrain
    # when "再培训": then ScoringRule::ReTrain
    end
    
  end
  
  before_save :calc_score

  def calc_score
    self.score = scoring_rule.score(self)
  end
  
  module ScoringRule
    module OffJobTrain

      def self.score(train)
        duration = (train.end_date - train.start_date).to_i
        case duration
        when 1..10 then 5
        when 11..20 then 10
        when 20..100 then 15
        else 0
        end
      end
    end

  end
  
end
