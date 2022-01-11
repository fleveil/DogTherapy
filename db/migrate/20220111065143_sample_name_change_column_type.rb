class SampleNameChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column(:reservations, :status, :string)
  end
end
