class RemoveParkCodeFromParks < ActiveRecord::Migration[6.0]
  def change
    remove_column :parks, :park_code, :string
  end
end
