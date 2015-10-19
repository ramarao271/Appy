require 'test_helper'

class CustomTailoringsControllerTest < ActionController::TestCase
  setup do
    @custom_tailoring = custom_tailorings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_tailorings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_tailoring" do
    assert_difference('CustomTailoring.count') do
      post :create, custom_tailoring: { around_arm: @custom_tailoring.around_arm, around_arm_hole: @custom_tailoring.around_arm_hole, around_bust: @custom_tailoring.around_bust, back_neck_depth: @custom_tailoring.back_neck_depth, back_neck_style: @custom_tailoring.back_neck_style, blouse_length: @custom_tailoring.blouse_length, blouse_opening: @custom_tailoring.blouse_opening, customer_id: @custom_tailoring.customer_id, fall_and_edging: @custom_tailoring.fall_and_edging, fitting: @custom_tailoring.fitting, front_neck_depth: @custom_tailoring.front_neck_depth, front_neck_style: @custom_tailoring.front_neck_style, lining: @custom_tailoring.lining, natural_waist: @custom_tailoring.natural_waist, petticoat_inskirt: @custom_tailoring.petticoat_inskirt, preset_name: @custom_tailoring.preset_name, product_id: @custom_tailoring.product_id, product_name: @custom_tailoring.product_name, shoulder: @custom_tailoring.shoulder, sleeve_length: @custom_tailoring.sleeve_length, sleeve_style: @custom_tailoring.sleeve_style, your_height: @custom_tailoring.your_height }
    end

    assert_redirected_to custom_tailoring_path(assigns(:custom_tailoring))
  end

  test "should show custom_tailoring" do
    get :show, id: @custom_tailoring
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_tailoring
    assert_response :success
  end

  test "should update custom_tailoring" do
    patch :update, id: @custom_tailoring, custom_tailoring: { around_arm: @custom_tailoring.around_arm, around_arm_hole: @custom_tailoring.around_arm_hole, around_bust: @custom_tailoring.around_bust, back_neck_depth: @custom_tailoring.back_neck_depth, back_neck_style: @custom_tailoring.back_neck_style, blouse_length: @custom_tailoring.blouse_length, blouse_opening: @custom_tailoring.blouse_opening, customer_id: @custom_tailoring.customer_id, fall_and_edging: @custom_tailoring.fall_and_edging, fitting: @custom_tailoring.fitting, front_neck_depth: @custom_tailoring.front_neck_depth, front_neck_style: @custom_tailoring.front_neck_style, lining: @custom_tailoring.lining, natural_waist: @custom_tailoring.natural_waist, petticoat_inskirt: @custom_tailoring.petticoat_inskirt, preset_name: @custom_tailoring.preset_name, product_id: @custom_tailoring.product_id, product_name: @custom_tailoring.product_name, shoulder: @custom_tailoring.shoulder, sleeve_length: @custom_tailoring.sleeve_length, sleeve_style: @custom_tailoring.sleeve_style, your_height: @custom_tailoring.your_height }
    assert_redirected_to custom_tailoring_path(assigns(:custom_tailoring))
  end

  test "should destroy custom_tailoring" do
    assert_difference('CustomTailoring.count', -1) do
      delete :destroy, id: @custom_tailoring
    end

    assert_redirected_to custom_tailorings_path
  end
end
