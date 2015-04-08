class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.string :email
      t.string :password
      t.string :fname
      t.string :lname
      t.string :country
      t.string :phone
      t.boolean :validated

      t.timestamps null: false
    end
  end
end
