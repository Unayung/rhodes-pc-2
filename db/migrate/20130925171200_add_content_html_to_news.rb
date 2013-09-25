class AddContentHtmlToNews < ActiveRecord::Migration
  def change
    add_column :news, :content_html, :text
  end
end
