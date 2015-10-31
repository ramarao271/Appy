require 'test_helper'

class CustomerReferEmailsControllerTest < ActionController::TestCase
  setup do
    @customer_refer_email = customer_refer_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_refer_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_refer_email" do
    assert_difference('CustomerReferEmail.count') do
      post :create, customer_refer_email: { customer_id: @customer_refer_email.customer_id, joined: @customer_refer_email.joined, no_of_times_sent: @customer_refer_email.no_of_times_sent, refer_email: @customer_refer_email.refer_email }
    end

    assert_redirected_to customer_refer_email_path(assigns(:customer_refer_email))
  end

  test "should show customer_refer_email" do
    get :show, id: @customer_refer_email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_refer_email
    assert_response :success
  end

  test "should update customer_refer_email" do
    patch :update, id: @customer_refer_email, customer_refer_email: { customer_id: @customer_refer_email.customer_id, joined: @customer_refer_email.joined, no_of_times_sent: @customer_refer_email.no_of_times_sent, refer_email: @customer_refer_email.refer_email }
    assert_redirected_to customer_refer_email_path(assigns(:customer_refer_email))
  end

  test "should destroy customer_refer_email" do
    assert_difference('CustomerReferEmail.count', -1) do
      delete :destroy, id: @customer_refer_email
    end

    assert_redirected_to customer_refer_emails_path
  end
end
