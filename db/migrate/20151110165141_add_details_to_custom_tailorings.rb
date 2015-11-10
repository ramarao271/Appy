class AddDetailsToCustomTailorings < ActiveRecord::Migration
  def change
    add_column :custom_tailorings, :front_neck_style_name, :string
    add_column :custom_tailorings, :back_neck_style_name, :string
    add_column :custom_tailorings, :sleeve_style_name, :string
  end
end
