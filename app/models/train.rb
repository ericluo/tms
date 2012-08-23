class Train < ActiveRecord::Base

  belongs_to :category
  belongs_to :trainee, class_name: "User"
  has_one :registrar, class_name: "User"
  
  attr_accessible :name, :start_date, :end_date, :comment
  attr_accessible :score, :period, :organizer
  attr_accessible :category_id, :trainee_id, :registrar_id
  # attr_accessible :certificate
end
