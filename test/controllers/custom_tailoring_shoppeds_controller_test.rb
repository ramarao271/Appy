require 'test_helper'

class CustomTailoringShoppedsControllerTest < ActionController::TestCase
  setup do
    @custom_tailoring_shopped = custom_tailoring_shoppeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_tailoring_shoppeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_tailoring_shopped" do
    assert_difference('CustomTailoringShopped.count') do
      post :create, custom_tailoring_shopped: { around_arm: @custom_tailoring_shopped.around_arm, around_arm_hole: @custom_tailoring_shopped.around_arm_hole, around_bust: @custom_tailoring_shopped.around_bust, back_neck_depth: @custom_tailoring_shopped.back_neck_depth, back_neck_style_name: @custom_tailoring_shopped.back_neck_style_name, back_neck_style_value: @custom_tailoring_shopped.back_neck_style_value, blouse_length: @custom_tailoring_shopped.blouse_length, blouse_opening: @custom_tailoring_shopped.blouse_opening, customer_id: @custom_tailoring_shopped.customer_id, fall_and_edging: @custom_tailoring_shopped.fall_and_edging, fitting: @custom_tailoring_shopped.fitting, front_neck_depth: @custom_tailoring_shopped.front_neck_depth, front_neck_style_name: @custom_tailoring_shopped.front_neck_style_name, front_neck_style_value: @custom_tailoring_shopped.front_neck_style_value, lining: @custom_tailoring_shopped.lining, natural_waist: @custom_tailoring_shopped.natural_waist, petticoat_inskirt: @custom_tailoring_shopped.petticoat_inskirt, preset_name: @custom_tailoring_shopped.preset_name, product_id: @custom_tailoring_shopped.product_id, product_name: @custom_tailoring_shopped.product_name, shoulder: @custom_tailoring_shopped.shoulder, sleeve_length: @custom_tailoring_shopped.sleeve_length, sleeve_style_name: @custom_tailoring_shopped.sleeve_style_name, sleeve_style_value: @custom_tailoring_shopped.sleeve_style_value, your_height: @custom_tailoring_shopped.your_height }
    end

    assert_redirected_to custom_tailoring_shopped_path(assigns(:custom_tailoring_shopped))
  end

  test "should show custom_tailoring_shopped" do
    get :show, id: @custom_tailoring_shopped
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_tailoring_shopped
    assert_response :success
  end

  test "should update custom_tailoring_shopped" do
    patch :update, id: @custom_tailoring_shopped, custom_tailoring_shopped: { around_arm: @custom_tailoring_shopped.around_arm, around_arm_hole: @custom_tailoring_shopped.around_arm_hole, around_bust: @custom_tailoring_shopped.around_bust, back_neck_depth: @custom_tailoring_shopped.back_neck_depth, back_neck_style_name: @custom_tailoring_shopped.back_neck_style_name, back_neck_style_value: @custom_tailoring_shopped.back_neck_style_value, blouse_length: @custom_tailoring_shopped.blouse_length, blouse_opening: @custom_tailoring_shopped.blouse_opening, customer_id: @custom_tailoring_shopped.customer_id, fall_and_edging: @custom_tailoring_shopped.fall_and_edging, fitting: @custom_tailoring_shopped.fitting, front_neck_depth: @custom_tailoring_shopped.front_neck_depth, front_neck_style_name: @custom_tailoring_shopped.front_neck_style_name, front_neck_style_value: @custom_tailoring_shopped.front_neck_style_value, lining: @custom_tailoring_shopped.lining, natural_waist: @custom_tailoring_shopped.natural_waist, petticoat_inskirt: @custom_tailoring_shopped.petticoat_inskirt, preset_name: @custom_tailoring_shopped.preset_name, product_id: @custom_tailoring_shopped.product_id, product_name: @custom_tailoring_shopped.product_name, shoulder: @custom_tailoring_shopped.shoulder, sleeve_length: @custom_tailoring_shopped.sleeve_length, sleeve_style_name: @custom_tailoring_shopped.sleeve_style_name, sleeve_style_value: @custom_tailoring_shopped.sleeve_style_value, your_height: @custom_tailoring_shopped.your_height }
    assert_redirected_to custom_tailoring_shopped_path(assigns(:custom_tailoring_shopped))
  end

  test "should destroy custom_tailoring_shopped" do
    assert_difference('CustomTailoringShopped.count', -1) do
      delete :destroy, id: @custom_tailoring_shopped
    end

    assert_redirected_to custom_tailoring_shoppeds_path
  end
end
