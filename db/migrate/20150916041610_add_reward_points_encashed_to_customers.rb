class AddRewardPointsEncashedToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :reward_points_encashed, :integer
  end
end
