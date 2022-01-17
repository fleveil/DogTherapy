class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
