class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.text :descrpition
      t.boolean :validated

      t.timestamps null: false
    end
  end
end
