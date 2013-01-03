class Exercise < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :name, :user_id

  has_attachments :photos
end
