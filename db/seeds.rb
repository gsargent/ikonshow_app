# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { 


# gfs notes:
# If the following worked, the id column would begin with 1.
# however, it continues from where it left off before the deletion.
# Actually, this needs to be the primary index - but don't know how to do this on the primary index.

#class DropAndAddIndex < ActiveRecord::Migration
#	def self.rebuild_index
	  #remove_index :lookup_skills, :skillname
      #add_index    :lookup_skills, :skillname, :unique => true
# 	end
#end

#DropAndAddIndex.rebuild_index



class ActiveRecord::Base
  # following is from: http://railspikes.com/2008/2/1/loading-seed-data

  # given a hash of attributes including the ID, look up the record by ID. 
  # If it does not exist, it is created with the rest of the options. 
  # If it exists, it is updated with the given options. 
  #
  # Raises an exception if the record is invalid to ensure seed data is loaded correctly.
  # 
  # Returns the record.
  def self.create_or_update(options = {})
    id = options.delete(:id)
    record = find_by_id(id) || new
    record.id = id
    record.attributes = options
    record.save!
    
    record
  end
end



skills = [
  {
    id:           1,
    sort_order:   10,
  	skillname:    'exact match', 
  	skillset:     'matching', 
  	description:  'Simple matchine where the stimulus is identical to one of the possible choices. Only a single match is made.'
  },
  {
    id:           2,
    sort_order:   20,
  	skillname:    'general match', 
  	skillset:     'matching', 
  	description:  'Match where stimulis is not exactly the same as the choices. For example if the stimulus is "A" and the choices are "a b c and d" then "a" matches.'
  },
  {
    id:           3,
    sort_order:   30,
  	skillname:    'simple sort',   
  	skillset:     'sorting',  
  	description:  'Arrange things into some order, e.g. alphabetical or numerical or small to large.'
  }
]


# following is from RailsCasts #179 Seed Data (but the id's migrate upwards!)
#LookupSkill.delete_all
#skills.each do |skill|
# LookupSkill.create! skill
#end


#update in place, else the id increments.
skills.each do |skill|
  LookupSkill.create_or_update skill
end
