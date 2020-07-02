class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.text :description
      t.string :states
      t.string :park_code

      t.timestamps
    end
  end
end
