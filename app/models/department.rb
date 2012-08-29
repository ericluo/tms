class Department < ActiveRecord::Base
  has_many :users

  attr_accessible :name, :order

end
