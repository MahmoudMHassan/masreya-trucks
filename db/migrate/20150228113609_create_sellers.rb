class CreateSellers < ActiveRecord::Migration
  def change
    create_table(:sellers, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :sellers, :users
    remove_column :sellers, :id
    execute "alter table sellers add primary key(user_id)"
  end
end
