class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :ad
      t.timestamps null: false
    end
  end
end
