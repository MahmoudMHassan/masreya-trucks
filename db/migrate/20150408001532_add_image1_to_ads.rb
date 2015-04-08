class AddImage1ToAds < ActiveRecord::Migration
  def change
    add_column :ads, :image1, :string
  end
end
