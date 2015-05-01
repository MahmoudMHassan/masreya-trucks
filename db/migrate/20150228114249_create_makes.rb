class CreateMakes < ActiveRecord::Migration
  def change
    create_table(:makes , :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.integer :user_id
      t.references :vehicle
      t.references :ad
      t.integer :new
      t.boolean :sale

      t.timestamps null: false
    end

    add_foreign_key :makes, :ads
    add_foreign_key :makes, :vehicles
    #remove_column :makes, :id
     #execute "alter table makes add primary key(user_id, ad_id, vehicle_id)"
     execute "alter table makes add foreign key(user_id) references users(id)"

  end
end
