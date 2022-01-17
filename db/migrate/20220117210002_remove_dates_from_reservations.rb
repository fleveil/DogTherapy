class RemoveDatesFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :start_date, :date
    remove_column :reservations, :end_date, :date
  end
end
