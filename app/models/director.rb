# == Schema Information
#
# Table name: directors
#
#  id         :bigint(8)        not null, primary key
#  name       :text
#  image      :text
#  yob        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Director < ApplicationRecord
  has_many  :movies
  has_many :categories, :as => :member
  has_many :lists, :through => :category
end
