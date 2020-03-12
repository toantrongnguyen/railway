class CreateCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :casts do |t|

      t.belongs_to :actor
      t.belongs_to :movie
      t.timestamps
    end
  end
end
