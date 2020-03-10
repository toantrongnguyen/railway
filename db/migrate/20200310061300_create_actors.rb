class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|

      t.string :name
      t.text :biography
      t.integer :gender, step: 1
      t.date :birthday
      t.timestamps
    end
  end
end
