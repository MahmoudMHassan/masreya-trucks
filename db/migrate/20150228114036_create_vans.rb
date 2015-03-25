class CreateVans < ActiveRecord::Migration
  def change
    create_table(:vans , :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.references :vehicle, index: true
      t.boolean :capacity
      t.integer :mileage

      t.timestamps null: false
    end
     add_foreign_key :vans, :vehicles
    remove_column :vans, :id
     execute "alter table vans add primary key(vehicle_id)"
  end
end
