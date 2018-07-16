# == Schema Information
#
# Table name: lists
#
#  id         :bigint(8)        not null, primary key
#  name       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ApplicationRecord

  has_many :categories
  has_many :members, :through => :categories
end
