class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.text :name
      t.text :image
      t.integer :yob

      t.timestamps
    end
  end
end
