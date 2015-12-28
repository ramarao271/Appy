require 'rails_helper'

RSpec.describe "premium_registration_settings/edit", type: :view do
  before(:each) do
    @premium_registration_setting = assign(:premium_registration_setting, PremiumRegistrationSetting.create!(
      :Value_of_coupon => 1,
      :Validity_of_coupon => 1,
      :No_of_Coupons => 1,
      :No_of_times_coupon_use => 1,
      :price_range_for_coupon_to_valid => 1,
      :use_coupons => false,
      :shop => "MyString"
    ))
  end

  it "renders the edit premium_registration_setting form" do
    render

    assert_select "form[action=?][method=?]", premium_registration_setting_path(@premium_registration_setting), "post" do

      assert_select "input#premium_registration_setting_Value_of_coupon[name=?]", "premium_registration_setting[Value_of_coupon]"

      assert_select "input#premium_registration_setting_Validity_of_coupon[name=?]", "premium_registration_setting[Validity_of_coupon]"

      assert_select "input#premium_registration_setting_No_of_Coupons[name=?]", "premium_registration_setting[No_of_Coupons]"

      assert_select "input#premium_registration_setting_No_of_times_coupon_use[name=?]", "premium_registration_setting[No_of_times_coupon_use]"

      assert_select "input#premium_registration_setting_price_range_for_coupon_to_valid[name=?]", "premium_registration_setting[price_range_for_coupon_to_valid]"

      assert_select "input#premium_registration_setting_use_coupons[name=?]", "premium_registration_setting[use_coupons]"

      assert_select "input#premium_registration_setting_shop[name=?]", "premium_registration_setting[shop]"
    end
  end
end
