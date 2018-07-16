# == Schema Information
#
# Table name: actors
#
#  id         :bigint(8)        not null, primary key
#  name       :text
#  image      :text
#  yob        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Actor < ApplicationRecord
  has_and_belongs_to_many :movies

end
