class Department < ActiveRecord::Base
  attr_accessible :name, :order

  has_many :users
end
