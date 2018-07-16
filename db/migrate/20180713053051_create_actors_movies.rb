class CreateActorsMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :actors_movies do |t|
      t.integer :movie_id
      t.integer :actor_id 
    end
  end
end
