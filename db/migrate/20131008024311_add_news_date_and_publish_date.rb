class AddNewsDateAndPublishDate < ActiveRecord::Migration
  def change
    # add_column :news, :will_publish_at
    add_column :news, :will_publish_at, :date
  end
end
