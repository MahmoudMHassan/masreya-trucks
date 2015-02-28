class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.date :manyear
      t.string :country
      t.integer :axles
      t.boolean :gearbox
      t.string :colour
      t.integer :price

      t.timestamps null: false
    end
  end
end
