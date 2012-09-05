class ReportDefinition < ActiveRecord::Base
  validates :name, :template, presence: true
  attr_accessible :name, :template

  has_many :reports
end
