class AddParkIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :park_id, :integer
  end
end
