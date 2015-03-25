class CreateSemitrailers < ActiveRecord::Migration
  def change
    create_table(:semitrailers, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8')  do |t|
      t.references :vehicle, index: true
      t.boolean :capacity

      t.timestamps null: false
    end
    add_foreign_key :semitrailers, :vehicles
    remove_column :semitrailers, :id
     execute "alter table semitrailers add primary key(vehicle_id)"
  end
end
