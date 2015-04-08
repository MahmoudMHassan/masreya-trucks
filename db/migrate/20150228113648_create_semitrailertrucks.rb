class CreateSemitrailertrucks < ActiveRecord::Migration
  def change
    create_table(:semitrailertrucks, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8')  do |t|
      t.references :vehicle, index: true
      t.integer :mileage
      t.timestamps null: false
    end
    add_foreign_key :semitrailertrucks, :vehicles
    remove_column :semitrailertrucks, :id
     execute "alter table semitrailertrucks add primary key(vehicle_id)"
  end
end
