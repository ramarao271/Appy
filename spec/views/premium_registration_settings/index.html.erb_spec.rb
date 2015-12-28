require 'rails_helper'

RSpec.describe "premium_registration_settings/index", type: :view do
  before(:each) do
    assign(:premium_registration_settings, [
      PremiumRegistrationSetting.create!(
        :Value_of_coupon => 1,
        :Validity_of_coupon => 2,
        :No_of_Coupons => 3,
        :No_of_times_coupon_use => 4,
        :price_range_for_coupon_to_valid => 5,
        :use_coupons => false,
        :shop => "Shop"
      ),
      PremiumRegistrationSetting.create!(
        :Value_of_coupon => 1,
        :Validity_of_coupon => 2,
        :No_of_Coupons => 3,
        :No_of_times_coupon_use => 4,
        :price_range_for_coupon_to_valid => 5,
        :use_coupons => false,
        :shop => "Shop"
      )
    ])
  end

  it "renders a list of premium_registration_settings" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Shop".to_s, :count => 2
  end
end
