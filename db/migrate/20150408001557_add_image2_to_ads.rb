class AddImage2ToAds < ActiveRecord::Migration
  def change
    add_column :ads, :image2, :string
  end
end
