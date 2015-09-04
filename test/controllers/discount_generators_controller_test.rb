require 'test_helper'

class DiscountGeneratorsControllerTest < ActionController::TestCase
  setup do
    @discount_generator = discount_generators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discount_generators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discount_generator" do
    assert_difference('DiscountGenerator.count') do
      post :create, discount_generator: { coupon_for: @discount_generator.coupon_for, coupon_prefix: @discount_generator.coupon_prefix, discount_type: @discount_generator.discount_type, end_date: @discount_generator.end_date, name_of_discount_campaign: @discount_generator.name_of_discount_campaign, no_of_coupons: @discount_generator.no_of_coupons, starts_at: @discount_generator.starts_at, value: @discount_generator.value }
    end

    assert_redirected_to discount_generator_path(assigns(:discount_generator))
  end

  test "should show discount_generator" do
    get :show, id: @discount_generator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discount_generator
    assert_response :success
  end

  test "should update discount_generator" do
    patch :update, id: @discount_generator, discount_generator: { coupon_for: @discount_generator.coupon_for, coupon_prefix: @discount_generator.coupon_prefix, discount_type: @discount_generator.discount_type, end_date: @discount_generator.end_date, name_of_discount_campaign: @discount_generator.name_of_discount_campaign, no_of_coupons: @discount_generator.no_of_coupons, starts_at: @discount_generator.starts_at, value: @discount_generator.value }
    assert_redirected_to discount_generator_path(assigns(:discount_generator))
  end

  test "should destroy discount_generator" do
    assert_difference('DiscountGenerator.count', -1) do
      delete :destroy, id: @discount_generator
    end

    assert_redirected_to discount_generators_path
  end
end
