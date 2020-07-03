class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :visit_id
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
