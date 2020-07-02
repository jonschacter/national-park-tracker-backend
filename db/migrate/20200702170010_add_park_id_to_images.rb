class AddParkIdToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :park_id, :integer
  end
end
