# == Schema Information
#
# Table name: movies
#
#  id          :bigint(8)        not null, primary key
#  title       :text
#  image       :text
#  year        :integer
#  plot        :text
#  director_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
