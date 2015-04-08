class AddImage3ToAds < ActiveRecord::Migration
  def change
    add_column :ads, :image3, :string
  end
end
