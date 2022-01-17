class AddDateToSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :date, :date
  end
end
