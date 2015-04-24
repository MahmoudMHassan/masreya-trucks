class CreateCompanySellers < ActiveRecord::Migration
  def change
    create_table(:company_sellers, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.references :user, index: true
      t.decimal :lng, :precision => 12, :scale => 8
      t.decimal :lat, :precision => 12, :scale => 8
      t.timestamps null: false
    end
    add_foreign_key :company_sellers, :users
    remove_column :company_sellers, :id
    execute "alter table company_sellers add primary key(user_id)"
  end
end
