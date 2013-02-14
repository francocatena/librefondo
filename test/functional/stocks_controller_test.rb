require 'test_helper'

class StocksControllerTest < ActionController::TestCase

  setup do
    @stock = Fabricate(:stock)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stocks)
    assert_select '#unexpected_error', false
    assert_template "stocks/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:stock)
    assert_select '#unexpected_error', false
    assert_template "stocks/new"
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post :create, stock: Fabricate.attributes_for(:stock)
    end

    assert_redirected_to stock_url(assigns(:stock))
  end

  test "should show stock" do
    get :show, id: @stock
    assert_response :success
    assert_not_nil assigns(:stock)
    assert_select '#unexpected_error', false
    assert_template "stocks/show"
  end

  test "should get edit" do
    get :edit, id: @stock
    assert_response :success
    assert_not_nil assigns(:stock)
    assert_select '#unexpected_error', false
    assert_template "stocks/edit"
  end

  test "should update stock" do
    put :update, id: @stock, 
      stock: Fabricate.attributes_for(:stock, attr: 'value')
    assert_redirected_to stock_url(assigns(:stock))
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete :destroy, id: @stock
    end

    assert_redirected_to stocks_path
  end
end
