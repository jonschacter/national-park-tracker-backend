class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.string :start_date
      t.string :end_date
      t.string :park_code

      t.timestamps
    end
  end
end
