class ChangePeopleColumns < ActiveRecord::Migration
  def change
    remove_column :people, :study_experience
    remove_column :people, :work_experience
    add_column :people, :description_up_right, :text
    add_column :people, :description_down_left, :text
  end

end
