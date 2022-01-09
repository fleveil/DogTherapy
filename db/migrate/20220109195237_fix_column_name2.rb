class FixColumnName2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :reservations, :confirmed, :status
  end
end
