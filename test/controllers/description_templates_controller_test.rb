require 'test_helper'

class DescriptionTemplatesControllerTest < ActionController::TestCase
  setup do
    @description_template = description_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:description_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create description_template" do
    assert_difference('DescriptionTemplate.count') do
      post :create, description_template: { description: @description_template.description, title: @description_template.title }
    end

    assert_redirected_to description_template_path(assigns(:description_template))
  end

  test "should show description_template" do
    get :show, id: @description_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @description_template
    assert_response :success
  end

  test "should update description_template" do
    patch :update, id: @description_template, description_template: { description: @description_template.description, title: @description_template.title }
    assert_redirected_to description_template_path(assigns(:description_template))
  end

  test "should destroy description_template" do
    assert_difference('DescriptionTemplate.count', -1) do
      delete :destroy, id: @description_template
    end

    assert_redirected_to description_templates_path
  end
end
