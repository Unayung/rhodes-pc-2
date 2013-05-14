class Person < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :title, :email, :study_experience, :work_experience
end
