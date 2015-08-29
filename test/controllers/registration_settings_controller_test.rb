require 'test_helper'

class RegistrationSettingsControllerTest < ActionController::TestCase
  setup do
    @registration_setting = registration_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration_setting" do
    assert_difference('RegistrationSetting.count') do
      post :create, registration_setting: { No_of_Coupons: @registration_setting.No_of_Coupons, No_of_times_coupon_use: @registration_setting.No_of_times_coupon_use, Validity_of_coupon: @registration_setting.Validity_of_coupon, Value_of_coupon: @registration_setting.Value_of_coupon, price_range_for_coupon_to_valid: @registration_setting.price_range_for_coupon_to_valid }
    end

    assert_redirected_to registration_setting_path(assigns(:registration_setting))
  end

  test "should show registration_setting" do
    get :show, id: @registration_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration_setting
    assert_response :success
  end

  test "should update registration_setting" do
    patch :update, id: @registration_setting, registration_setting: { No_of_Coupons: @registration_setting.No_of_Coupons, No_of_times_coupon_use: @registration_setting.No_of_times_coupon_use, Validity_of_coupon: @registration_setting.Validity_of_coupon, Value_of_coupon: @registration_setting.Value_of_coupon, price_range_for_coupon_to_valid: @registration_setting.price_range_for_coupon_to_valid }
    assert_redirected_to registration_setting_path(assigns(:registration_setting))
  end

  test "should destroy registration_setting" do
    assert_difference('RegistrationSetting.count', -1) do
      delete :destroy, id: @registration_setting
    end

    assert_redirected_to registration_settings_path
  end
end
