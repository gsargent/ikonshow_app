class LookupSkill < ActiveRecord::Base
  has_many :exercises
  attr_accessible :line_num, :description, :skillname, :skillset
end
