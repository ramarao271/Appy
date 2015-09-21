require 'test_helper'

class AffiliateRewardSettingsControllerTest < ActionController::TestCase
  setup do
    @affiliate_reward_setting = affiliate_reward_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affiliate_reward_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affiliate_reward_setting" do
    assert_difference('AffiliateRewardSetting.count') do
      post :create, affiliate_reward_setting: { amount_for_min_redeem_points: @affiliate_reward_setting.amount_for_min_redeem_points, coupon_validity: @affiliate_reward_setting.coupon_validity, maximum_orders_of_referee_to_consider: @affiliate_reward_setting.maximum_orders_of_referee_to_consider, maximum_points_to_redeem: @affiliate_reward_setting.maximum_points_to_redeem, min_points_to_redeem: @affiliate_reward_setting.min_points_to_redeem, min_purchase_amount_earn_points: @affiliate_reward_setting.min_purchase_amount_earn_points, minimum_purchase_amount: @affiliate_reward_setting.minimum_purchase_amount, minmum_purchase_amount_for_refer: @affiliate_reward_setting.minmum_purchase_amount_for_refer, points_earn_for_min_amount: @affiliate_reward_setting.points_earn_for_min_amount, points_for_referral: @affiliate_reward_setting.points_for_referral, points_for_registration: @affiliate_reward_setting.points_for_registration, referee_premium_membership_validity: @affiliate_reward_setting.referee_premium_membership_validity }
    end

    assert_redirected_to affiliate_reward_setting_path(assigns(:affiliate_reward_setting))
  end

  test "should show affiliate_reward_setting" do
    get :show, id: @affiliate_reward_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @affiliate_reward_setting
    assert_response :success
  end

  test "should update affiliate_reward_setting" do
    patch :update, id: @affiliate_reward_setting, affiliate_reward_setting: { amount_for_min_redeem_points: @affiliate_reward_setting.amount_for_min_redeem_points, coupon_validity: @affiliate_reward_setting.coupon_validity, maximum_orders_of_referee_to_consider: @affiliate_reward_setting.maximum_orders_of_referee_to_consider, maximum_points_to_redeem: @affiliate_reward_setting.maximum_points_to_redeem, min_points_to_redeem: @affiliate_reward_setting.min_points_to_redeem, min_purchase_amount_earn_points: @affiliate_reward_setting.min_purchase_amount_earn_points, minimum_purchase_amount: @affiliate_reward_setting.minimum_purchase_amount, minmum_purchase_amount_for_refer: @affiliate_reward_setting.minmum_purchase_amount_for_refer, points_earn_for_min_amount: @affiliate_reward_setting.points_earn_for_min_amount, points_for_referral: @affiliate_reward_setting.points_for_referral, points_for_registration: @affiliate_reward_setting.points_for_registration, referee_premium_membership_validity: @affiliate_reward_setting.referee_premium_membership_validity }
    assert_redirected_to affiliate_reward_setting_path(assigns(:affiliate_reward_setting))
  end

  test "should destroy affiliate_reward_setting" do
    assert_difference('AffiliateRewardSetting.count', -1) do
      delete :destroy, id: @affiliate_reward_setting
    end

    assert_redirected_to affiliate_reward_settings_path
  end
end
