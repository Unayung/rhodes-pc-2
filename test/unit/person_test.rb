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
require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
