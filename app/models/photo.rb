class Photo < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :person
  mount_uploader :image, ImageUploader
end
