class AddParkCodeToParks < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :code, :string
  end
end
