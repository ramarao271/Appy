require 'test_helper'

class DiscountsControllerTest < ActionController::TestCase
  setup do
    @discount = discounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discount" do
    assert_difference('Discount.count') do
      post :create, discount: { applies_once: @discount.applies_once, applies_to_id: @discount.applies_to_id, applies_to_resource: @discount.applies_to_resource, code: @discount.code, creation_date: @discount.creation_date, discount_type: @discount.discount_type, ends_at: @discount.ends_at, minimum_order_amount: @discount.minimum_order_amount, starts_at: @discount.starts_at, status: @discount.status, times_used: @discount.times_used, usage_limit: @discount.usage_limit, value: @discount.value }
    end

    assert_redirected_to discount_path(assigns(:discount))
  end

  test "should show discount" do
    get :show, id: @discount
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discount
    assert_response :success
  end

  test "should update discount" do
    patch :update, id: @discount, discount: { applies_once: @discount.applies_once, applies_to_id: @discount.applies_to_id, applies_to_resource: @discount.applies_to_resource, code: @discount.code, creation_date: @discount.creation_date, discount_type: @discount.discount_type, ends_at: @discount.ends_at, minimum_order_amount: @discount.minimum_order_amount, starts_at: @discount.starts_at, status: @discount.status, times_used: @discount.times_used, usage_limit: @discount.usage_limit, value: @discount.value }
    assert_redirected_to discount_path(assigns(:discount))
  end

  test "should destroy discount" do
    assert_difference('Discount.count', -1) do
      delete :destroy, id: @discount
    end

    assert_redirected_to discounts_path
  end
end
