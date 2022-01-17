class RemoveDatesFromSearch < ActiveRecord::Migration[6.0]
  def change
    remove_column :searches, :start_date, :date
    remove_column :searches, :end_date, :date
  end
end
