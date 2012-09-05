class Department < ActiveRecord::Base
  validates :name, :order, presence: true
  validates :name, uniqueness: true

  has_many :users

  attr_accessible :name, :order

end
