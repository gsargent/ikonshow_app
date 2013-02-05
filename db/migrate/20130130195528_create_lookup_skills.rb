class CreateLookupSkills < ActiveRecord::Migration
  def change
    create_table :lookup_skills do |t|
      t.integer :sort_order
      t.string :skillname
      t.string :skillset
      t.text :description

      t.timestamps
    end
    add_index :lookup_skills, :skillname, :unique => true
  end
end
