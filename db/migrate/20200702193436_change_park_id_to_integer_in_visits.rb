class ChangeParkIdToIntegerInVisits < ActiveRecord::Migration[6.0]
  def change
    # change_column :visits, :park_id, :integer
    change_column :visits, :park_id, 'integer USING CAST(park_id AS integer)'
  end
end
