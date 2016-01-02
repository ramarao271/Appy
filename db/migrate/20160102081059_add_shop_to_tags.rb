class AddShopToTags < ActiveRecord::Migration
  def change
    add_column :tags, :shop, :string
  end
end
