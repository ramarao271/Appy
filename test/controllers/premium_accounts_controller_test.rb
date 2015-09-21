require 'test_helper'

class PremiumAccountsControllerTest < ActionController::TestCase
  setup do
    @premium_account = premium_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premium_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premium_account" do
    assert_difference('PremiumAccount.count') do
      post :create, premium_account: { amount: @premium_account.amount, description: @premium_account.description, name: @premium_account.name, validity: @premium_account.validity }
    end

    assert_redirected_to premium_account_path(assigns(:premium_account))
  end

  test "should show premium_account" do
    get :show, id: @premium_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @premium_account
    assert_response :success
  end

  test "should update premium_account" do
    patch :update, id: @premium_account, premium_account: { amount: @premium_account.amount, description: @premium_account.description, name: @premium_account.name, validity: @premium_account.validity }
    assert_redirected_to premium_account_path(assigns(:premium_account))
  end

  test "should destroy premium_account" do
    assert_difference('PremiumAccount.count', -1) do
      delete :destroy, id: @premium_account
    end

    assert_redirected_to premium_accounts_path
  end
end
