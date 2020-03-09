class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|

      t.string "title"
      t.text "description"
      t.date "release_year"
      t.timestamps
    end
  end
end
