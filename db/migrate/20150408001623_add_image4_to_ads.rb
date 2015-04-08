class AddImage4ToAds < ActiveRecord::Migration
  def change
    add_column :ads, :image4, :string
  end
end
