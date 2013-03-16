require 'minitest_helper'

class TrustFundsControllerTest < ActionController::TestCase

  setup do
    @trust_fund = Fabricate(:trust_fund)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trust_funds)
    assert_select '#unexpected_error', false
    assert_template "trust_funds/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:trust_fund)
    assert_select '#unexpected_error', false
    assert_template "trust_funds/new"
  end

  test "should create trust_fund" do
    assert_difference('TrustFund.count') do
      post :create, trust_fund: Fabricate.attributes_for(:trust_fund)
    end

    assert_redirected_to trust_fund_url(assigns(:trust_fund))
  end

  test "should show trust_fund" do
    get :show, id: @trust_fund
    assert_response :success
    assert_not_nil assigns(:trust_fund)
    assert_select '#unexpected_error', false
    assert_template "trust_funds/show"
  end

  test "should get edit" do
    get :edit, id: @trust_fund
    assert_response :success
    assert_not_nil assigns(:trust_fund)
    assert_select '#unexpected_error', false
    assert_template "trust_funds/edit"
  end

  test "should update trust_fund" do
    put :update, id: @trust_fund, 
      trust_fund: Fabricate.attributes_for(:trust_fund, name: 'value')
    assert_redirected_to trust_fund_url(assigns(:trust_fund))
  end

  test "should destroy trust_fund" do
    assert_difference('TrustFund.count', -1) do
      delete :destroy, id: @trust_fund
    end

    assert_redirected_to trust_funds_path
  end
end
