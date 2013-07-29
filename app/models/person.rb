# == Schema Information
#
# Table name: people
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  title            :string(255)
#  study_experience :string(255)
#  work_experience  :string(255)
#  email            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

# -*- encoding : utf-8 -*-
class Person < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :title, :email, :study_experience, :work_experience
end
