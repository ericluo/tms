class Department < ActiveRecord::Base
  has_many :users

  attr_accessible :name, :order

  self.per_page = 10
end
