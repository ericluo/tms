class Category < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :name, :scoring_rule, :parent_id

end
