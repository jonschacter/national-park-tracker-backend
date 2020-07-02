class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url
      t.text :caption
      t.string :alt
        
      t.timestamps
    end
  end
end
