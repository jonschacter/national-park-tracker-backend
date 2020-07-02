class ChangeParkIdToIntegerInVisits < ActiveRecord::Migration[6.0]
  def change
    change_column :visits, :park_id, :integer
  end
end
