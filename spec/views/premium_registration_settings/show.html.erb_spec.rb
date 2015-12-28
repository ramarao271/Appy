require 'rails_helper'

RSpec.describe "premium_registration_settings/show", type: :view do
  before(:each) do
    @premium_registration_setting = assign(:premium_registration_setting, PremiumRegistrationSetting.create!(
      :Value_of_coupon => 1,
      :Validity_of_coupon => 2,
      :No_of_Coupons => 3,
      :No_of_times_coupon_use => 4,
      :price_range_for_coupon_to_valid => 5,
      :use_coupons => false,
      :shop => "Shop"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Shop/)
  end
end
