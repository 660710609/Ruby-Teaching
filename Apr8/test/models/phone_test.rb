# == Schema Information
#
# Table name: phones
#
#  id         :bigint           not null, primary key
#  label      :string
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  person_id  :bigint           not null
#
require "test_helper"

class PhoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
