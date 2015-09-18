require 'test_helper'

class MissedCouponsControllerTest < ActionController::TestCase
  setup do
    @missed_coupon = missed_coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:missed_coupons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create missed_coupon" do
    assert_difference('MissedCoupon.count') do
      post :create, missed_coupon: { Identified_at: @missed_coupon.Identified_at, coupon_for: @missed_coupon.coupon_for, coupon_validity: @missed_coupon.coupon_validity, coupon_value: @missed_coupon.coupon_value, coupoun_id: @missed_coupon.coupoun_id, current_status: @missed_coupon.current_status, customer_id: @missed_coupon.customer_id, updated_customer: @missed_coupon.updated_customer }
    end

    assert_redirected_to missed_coupon_path(assigns(:missed_coupon))
  end

  test "should show missed_coupon" do
    get :show, id: @missed_coupon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @missed_coupon
    assert_response :success
  end

  test "should update missed_coupon" do
    patch :update, id: @missed_coupon, missed_coupon: { Identified_at: @missed_coupon.Identified_at, coupon_for: @missed_coupon.coupon_for, coupon_validity: @missed_coupon.coupon_validity, coupon_value: @missed_coupon.coupon_value, coupoun_id: @missed_coupon.coupoun_id, current_status: @missed_coupon.current_status, customer_id: @missed_coupon.customer_id, updated_customer: @missed_coupon.updated_customer }
    assert_redirected_to missed_coupon_path(assigns(:missed_coupon))
  end

  test "should destroy missed_coupon" do
    assert_difference('MissedCoupon.count', -1) do
      delete :destroy, id: @missed_coupon
    end

    assert_redirected_to missed_coupons_path
  end
end
