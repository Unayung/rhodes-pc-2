class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :will_publish_at
      t.string :event_file
      t.timestamps
    end
  end
end
