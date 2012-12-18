class Exercise < ActiveRecord::Base
  attr_accessible :name

  has_attachments :photos
end
