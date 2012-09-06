class ReportDefinition < ActiveRecord::Base
  validates :name, :template, presence: true
  validates :name, uniqueness: true
  attr_accessible :name, :template

  has_many :reports
end
