class AddPhotosToPerson < ActiveRecord::Migration
  def change
    add_column :people, :thumb_photo, :string
    add_column :people, :full_photo, :string
  end
end
