require 'minitest_helper'

class FundsControllerTest < ActionController::TestCase

  setup do
    @fund = Fabricate(:fund)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funds)
    assert_select '#unexpected_error', false
    assert_template "funds/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:fund)
    assert_select '#unexpected_error', false
    assert_template "funds/new"
  end

  test "should create fund" do
    assert_difference('Fund.count') do
      post :create, fund: Fabricate.attributes_for(:fund)
    end

    assert_redirected_to fund_url(assigns(:fund))
  end

  test "should show fund" do
    get :show, id: @fund
    assert_response :success
    assert_not_nil assigns(:fund)
    assert_select '#unexpected_error', false
    assert_template "funds/show"
  end

  test "should get edit" do
    get :edit, id: @fund
    assert_response :success
    assert_not_nil assigns(:fund)
    assert_select '#unexpected_error', false
    assert_template "funds/edit"
  end

  test "should update fund" do
    put :update, id: @fund, 
      fund: Fabricate.attributes_for(:fund, name: 'value')
    assert_redirected_to fund_url(assigns(:fund))
  end

  test "should destroy fund" do
    assert_difference('Fund.count', -1) do
      delete :destroy, id: @fund
    end

    assert_redirected_to funds_path
  end
end
