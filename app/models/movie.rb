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

class Movie < ApplicationRecord
  has_and_belongs_to_many :actors
  belongs_to  :director, :optional => true

  has_many :categories, :as => :member
  has_many :lists, :through => :categories
end
