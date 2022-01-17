class AddRadiusToSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :radius, :integer
  end
end
