class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :list_id
      t.integer :member_id
      t.string :member_type
      t.timestamps
    end
  end
end
