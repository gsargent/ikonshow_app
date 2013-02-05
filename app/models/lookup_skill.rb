class LookupSkill < ActiveRecord::Base
  has_many :exercises
  attr_accessible :sort_order, :description, :skillname, :skillset
end
