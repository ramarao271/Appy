require 'test_helper'

class RegistrationCouponsControllerTest < ActionController::TestCase
  setup do
    @registration_coupon = registration_coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_coupons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration_coupon" do
    assert_difference('RegistrationCoupon.count') do
      post :create, registration_coupon: { coupon_value: @registration_coupon.coupon_value, price_range: @registration_coupon.price_range }
    end

    assert_redirected_to registration_coupon_path(assigns(:registration_coupon))
  end

  test "should show registration_coupon" do
    get :show, id: @registration_coupon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration_coupon
    assert_response :success
  end

  test "should update registration_coupon" do
    patch :update, id: @registration_coupon, registration_coupon: { coupon_value: @registration_coupon.coupon_value, price_range: @registration_coupon.price_range }
    assert_redirected_to registration_coupon_path(assigns(:registration_coupon))
  end

  test "should destroy registration_coupon" do
    assert_difference('RegistrationCoupon.count', -1) do
      delete :destroy, id: @registration_coupon
    end

    assert_redirected_to registration_coupons_path
  end
end
