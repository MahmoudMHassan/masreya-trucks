class CreateSemitrailers < ActiveRecord::Migration
  def change
    create_table :semitrailers do |t|
      t.references :vehicle, index: true
      t.integer :capactiy

      t.timestamps null: false
    end
    add_foreign_key :semitrailers, :vehicles
    remove_column :semitrailers, :id
     execute "alter table semitrailers add primary key(vehicle_id)"
  end
end