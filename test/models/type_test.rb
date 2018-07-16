# == Schema Information
#
# Table name: types
#
#  id          :bigint(8)        not null, primary key
#  list_id     :integer
#  director_id :integer
#  movie_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
