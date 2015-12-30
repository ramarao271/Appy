class AddBottomStyleToCustomTailorings < ActiveRecord::Migration
  def change
    add_column :custom_tailorings, :bottom_style, :string
  end
end
