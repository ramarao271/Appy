require 'test_helper'

class ProductDescriptionsControllerTest < ActionController::TestCase
  setup do
    @product_description = product_descriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_description" do
    assert_difference('ProductDescription.count') do
      post :create, product_description: { description: @product_description.description, product_id: @product_description.product_id, title: @product_description.title }
    end

    assert_redirected_to product_description_path(assigns(:product_description))
  end

  test "should show product_description" do
    get :show, id: @product_description
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_description
    assert_response :success
  end

  test "should update product_description" do
    patch :update, id: @product_description, product_description: { description: @product_description.description, product_id: @product_description.product_id, title: @product_description.title }
    assert_redirected_to product_description_path(assigns(:product_description))
  end

  test "should destroy product_description" do
    assert_difference('ProductDescription.count', -1) do
      delete :destroy, id: @product_description
    end

    assert_redirected_to product_descriptions_path
  end
end
