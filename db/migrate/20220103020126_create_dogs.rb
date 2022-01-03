class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :breed
      t.integer :energy
      t.integer :affection
      t.integer :size
      t.boolean :hypoallergenic
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
