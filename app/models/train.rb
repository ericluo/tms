class Train < ActiveRecord::Base
  belongs_to :category, class_name: "TrainCategory"
  belongs_to :trainee, :class_name => "User"

  attr_accessible :category_id, :duration, :end_date, :organizer, :start_date, :trainee_id
end
