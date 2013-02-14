require 'test_helper'

class RatesControllerTest < ActionController::TestCase

  setup do
    @rate = Fabricate(:rate)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rates)
    assert_select '#unexpected_error', false
    assert_template "rates/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:rate)
    assert_select '#unexpected_error', false
    assert_template "rates/new"
  end

  test "should create rate" do
    assert_difference('Rate.count') do
      post :create, rate: Fabricate.attributes_for(:rate)
    end

    assert_redirected_to rate_url(assigns(:rate))
  end

  test "should show rate" do
    get :show, id: @rate
    assert_response :success
    assert_not_nil assigns(:rate)
    assert_select '#unexpected_error', false
    assert_template "rates/show"
  end

  test "should get edit" do
    get :edit, id: @rate
    assert_response :success
    assert_not_nil assigns(:rate)
    assert_select '#unexpected_error', false
    assert_template "rates/edit"
  end

  test "should update rate" do
    put :update, id: @rate, 
      rate: Fabricate.attributes_for(:rate, attr: 'value')
    assert_redirected_to rate_url(assigns(:rate))
  end

  test "should destroy rate" do
    assert_difference('Rate.count', -1) do
      delete :destroy, id: @rate
    end

    assert_redirected_to rates_path
  end
end
