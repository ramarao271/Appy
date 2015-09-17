require 'test_helper'

class EncashSettingsControllerTest < ActionController::TestCase
  setup do
    @encash_setting = encash_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encash_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encash_setting" do
    assert_difference('EncashSetting.count') do
      post :create, encash_setting: { affiliate_account_percentage: @encash_setting.affiliate_account_percentage, is_applicable_to_affiliate: @encash_setting.is_applicable_to_affiliate, is_applicable_to_premium: @encash_setting.is_applicable_to_premium, is_applicable_to_standard: @encash_setting.is_applicable_to_standard, minimum_points_to_encash: @encash_setting.minimum_points_to_encash, premium_account_percentage: @encash_setting.premium_account_percentage, standard_account_percentage: @encash_setting.standard_account_percentage }
    end

    assert_redirected_to encash_setting_path(assigns(:encash_setting))
  end

  test "should show encash_setting" do
    get :show, id: @encash_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encash_setting
    assert_response :success
  end

  test "should update encash_setting" do
    patch :update, id: @encash_setting, encash_setting: { affiliate_account_percentage: @encash_setting.affiliate_account_percentage, is_applicable_to_affiliate: @encash_setting.is_applicable_to_affiliate, is_applicable_to_premium: @encash_setting.is_applicable_to_premium, is_applicable_to_standard: @encash_setting.is_applicable_to_standard, minimum_points_to_encash: @encash_setting.minimum_points_to_encash, premium_account_percentage: @encash_setting.premium_account_percentage, standard_account_percentage: @encash_setting.standard_account_percentage }
    assert_redirected_to encash_setting_path(assigns(:encash_setting))
  end

  test "should destroy encash_setting" do
    assert_difference('EncashSetting.count', -1) do
      delete :destroy, id: @encash_setting
    end

    assert_redirected_to encash_settings_path
  end
end
