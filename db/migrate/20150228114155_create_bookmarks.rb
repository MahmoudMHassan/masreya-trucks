class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :user, index: true
      t.references :ad, index: true

      t.timestamps null: false
    end
    add_foreign_key :bookmarks, :users
    add_foreign_key :bookmarks, :ads
    remove_column :bookmarks, :id
     execute "alter table bookmarks add primary key(user_id, ad_id)"
  end
end
