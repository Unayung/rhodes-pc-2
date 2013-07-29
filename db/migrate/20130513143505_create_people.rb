# -*- encoding : utf-8 -*-
class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :title
      t.string :study_experience
      t.string :work_experience
      t.string :email
      t.timestamps
    end
  end
end
