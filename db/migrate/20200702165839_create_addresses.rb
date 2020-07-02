class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :type
      t.string :line1
      t.string :line2
      t.string :line3
      t.string :city
      t.string :state
      t.string :postal

      t.timestamps
    end
  end
end
