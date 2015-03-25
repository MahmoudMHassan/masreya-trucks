class CreateAds < ActiveRecord::Migration
  def change
    create_table(:ads, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8')  do |t|
      t.string :title
      t.text :description
      t.boolean :validated
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
