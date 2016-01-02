class ChangeIndexForTags < ActiveRecord::Migration
  def change
    remove_index :tags,:tag, unique: true
    add_index :tags, [:tag, :shop], unique: true
  end
end
