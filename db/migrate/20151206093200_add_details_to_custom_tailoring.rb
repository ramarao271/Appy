class AddDetailsToCustomTailoring < ActiveRecord::Migration
  def change
    add_column :custom_tailorings, :inskirt_length, :string
    add_column :custom_tailorings, :around_waist_size, :string
  end
end
