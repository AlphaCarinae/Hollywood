# == Schema Information
#
# Table name: categories
#
#  id          :bigint(8)        not null, primary key
#  list_id     :integer
#  member_id   :integer
#  member_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ApplicationRecord
  belongs_to :list
  belongs_to :member, :polymorphic => true
end
