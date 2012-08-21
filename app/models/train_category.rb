class TrainCategory < ActiveRecord::Base
  has_many :trains
  
  attr_accessible :name, :weight
end
