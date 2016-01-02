class ChangeIndexForTags < ActiveRecord::Migration
  def change
    remove_index :tags,:tag
    add_index :tags, [:tag, :shop], unique: true
  end
end
