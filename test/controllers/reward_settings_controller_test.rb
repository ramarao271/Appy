require 'test_helper'

class RewardSettingsControllerTest < ActionController::TestCase
  setup do
    @reward_setting = reward_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_setting" do
    assert_difference('RewardSetting.count') do
      post :create, reward_setting: { amount_for_min_redeem_points: @reward_setting.amount_for_min_redeem_points, min_points_to_redeem: @reward_setting.min_points_to_redeem, min_purchase_amount_earn_points: @reward_setting.min_purchase_amount_earn_points, points_earn_for_min_amount: @reward_setting.points_earn_for_min_amount, points_for_referral: @reward_setting.points_for_referral, points_for_registration: @reward_setting.points_for_registration }
    end

    assert_redirected_to reward_setting_path(assigns(:reward_setting))
  end

  test "should show reward_setting" do
    get :show, id: @reward_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_setting
    assert_response :success
  end

  test "should update reward_setting" do
    patch :update, id: @reward_setting, reward_setting: { amount_for_min_redeem_points: @reward_setting.amount_for_min_redeem_points, min_points_to_redeem: @reward_setting.min_points_to_redeem, min_purchase_amount_earn_points: @reward_setting.min_purchase_amount_earn_points, points_earn_for_min_amount: @reward_setting.points_earn_for_min_amount, points_for_referral: @reward_setting.points_for_referral, points_for_registration: @reward_setting.points_for_registration }
    assert_redirected_to reward_setting_path(assigns(:reward_setting))
  end

  test "should destroy reward_setting" do
    assert_difference('RewardSetting.count', -1) do
      delete :destroy, id: @reward_setting
    end

    assert_redirected_to reward_settings_path
  end
end
