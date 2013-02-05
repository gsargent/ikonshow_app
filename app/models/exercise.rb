class Exercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :lookup_skill
  
  attr_accessible :name, :user_id, :lookup_skill_id

  has_attachments :photos
end
