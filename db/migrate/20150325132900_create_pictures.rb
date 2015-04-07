class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :make
      t.timestamps null: false
    end
    add_foreign_key :pictures, :makes
  end
end
