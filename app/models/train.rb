# -*- coding: utf-8 -*-
class Train < ActiveRecord::Base

  belongs_to :trainee, class_name: "User"
  belongs_to :registrar, class_name: "User"
  
  attr_accessible :name, :category, :score, :comment, :organizer
  attr_accessible :start_date, :end_date, :period
  attr_accessible :trainee_id, :registrar_id, :in_job_train_catalog_id
  # attr_accessible :certificate

  CATEGORIES = %w[脱产培训 讲座培训 在岗培训 再培训 其他培训]
  
  def scoring_rule
    case category
    when "脱产培训" then ScoringRule::OffJobTrain
    when "讲座培训" then ScoringRule::LectureTrain
    when "在岗培训" then ScoringRule::InJobTrain
    when "再培训" then ScoringRule::ReTrain
    end
    
  end
  
  before_save :calc_score

  def calc_score
    self.score = scoring_rule.score(self)
  end
  
  module ScoringRule
    module OffJobTrain

      def self.score(train)
        duration = train.period.nil? ? (train.end_date - train.start_date).to_i : train.period
        scores = duration * 3
        case duration
        when 1..3 then [scores, 8].min
        when 4..7 then [scores, 15].min
        when 8..(1 / 0.0) then [scores,20].min
        else raise "duartion should be positive"
        end
      end
    end

    module LectureTrain
      def self.score(train)
        2
      end
    end

    module InJobTrain
      def self.score(train)
        c = InJobTrainCatalog.find(train.in_job_train_catalog_id)
        c.score
      end
    end

    module ReTrain
      def self.score(train)
        10
      end
    end
      
  end

    
  
end
