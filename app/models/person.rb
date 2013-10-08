# == Schema Information
#
# Table name: people
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  title                 :string(255)
#  email                 :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  description_up_right  :text
#  description_down_left :text
#  thumb_photo           :string(255)
#  full_photo            :string(255)
#  url                   :string(255)
#

# -*- encoding : utf-8 -*-
class Person < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :title, :email, :thumb_photo, :full_photo, :description_up_right, :description_down_left, :url
  validates_presence_of :name, :title

  mount_uploader :thumb_photo, ThumbUploader
  mount_uploader :full_photo, FullUploader

  acts_as_url :name

  def to_param
    url # or whatever you set :url_attribute to
  end
end
