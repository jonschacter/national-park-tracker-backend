class RenameParkCodeToParkIdForVisits < ActiveRecord::Migration[6.0]
  def change
    rename_column :visits, :park_code, :park_id
  end
end
