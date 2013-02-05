class AddSkillToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :lookup_skill_id, :integer
  end
end
