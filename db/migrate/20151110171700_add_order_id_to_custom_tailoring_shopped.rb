class AddOrderIdToCustomTailoringShopped < ActiveRecord::Migration
  def change
    add_column :custom_tailoring_shoppeds, :order_id, :decimal
  end
end
