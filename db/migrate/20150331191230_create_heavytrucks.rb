class CreateHeavytrucks < ActiveRecord::Migration
  def change
    create_table(:heavytrucks, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.boolean :capacity
      t.integer :mileage
      t.references :vehicle, index: true

      t.timestamps null: false
    end
    add_foreign_key :heavytrucks, :vehicles
    remove_column :heavytrucks, :id
    execute "alter table heavytrucks add primary key(vehicle_id)"
  end
end
