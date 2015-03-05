class CreateBuyers < ActiveRecord::Migration
  def change
    create_table(:buyers, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :buyers, :users
    remove_column :buyers, :id
    execute "alter table buyers add primary key(user_id)"
  end
end
