require 'test_helper'

class PremiumRewardSettingsControllerTest < ActionController::TestCase
  setup do
    @premium_reward_setting = premium_reward_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premium_reward_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premium_reward_setting" do
    assert_difference('PremiumRewardSetting.count') do
      post :create, premium_reward_setting: { amount_for_min_redeem_points: @premium_reward_setting.amount_for_min_redeem_points, coupon_validity: @premium_reward_setting.coupon_validity, maximum_points_to_redeem: @premium_reward_setting.maximum_points_to_redeem, min_points_to_redeem: @premium_reward_setting.min_points_to_redeem, min_purchase_amount_earn_points: @premium_reward_setting.min_purchase_amount_earn_points, minimum_purchase_amount: @premium_reward_setting.minimum_purchase_amount, minmum_purchase_amount_for_refer: @premium_reward_setting.minmum_purchase_amount_for_refer, points_earn_for_min_amount: @premium_reward_setting.points_earn_for_min_amount, points_for_referral: @premium_reward_setting.points_for_referral, points_for_registration: @premium_reward_setting.points_for_registration, referee_premium_membership_validity: @premium_reward_setting.referee_premium_membership_validity }
    end

    assert_redirected_to premium_reward_setting_path(assigns(:premium_reward_setting))
  end

  test "should show premium_reward_setting" do
    get :show, id: @premium_reward_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @premium_reward_setting
    assert_response :success
  end

  test "should update premium_reward_setting" do
    patch :update, id: @premium_reward_setting, premium_reward_setting: { amount_for_min_redeem_points: @premium_reward_setting.amount_for_min_redeem_points, coupon_validity: @premium_reward_setting.coupon_validity, maximum_points_to_redeem: @premium_reward_setting.maximum_points_to_redeem, min_points_to_redeem: @premium_reward_setting.min_points_to_redeem, min_purchase_amount_earn_points: @premium_reward_setting.min_purchase_amount_earn_points, minimum_purchase_amount: @premium_reward_setting.minimum_purchase_amount, minmum_purchase_amount_for_refer: @premium_reward_setting.minmum_purchase_amount_for_refer, points_earn_for_min_amount: @premium_reward_setting.points_earn_for_min_amount, points_for_referral: @premium_reward_setting.points_for_referral, points_for_registration: @premium_reward_setting.points_for_registration, referee_premium_membership_validity: @premium_reward_setting.referee_premium_membership_validity }
    assert_redirected_to premium_reward_setting_path(assigns(:premium_reward_setting))
  end

  test "should destroy premium_reward_setting" do
    assert_difference('PremiumRewardSetting.count', -1) do
      delete :destroy, id: @premium_reward_setting
    end

    assert_redirected_to premium_reward_settings_path
  end
end
