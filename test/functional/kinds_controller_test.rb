require 'test_helper'

class KindsControllerTest < ActionController::TestCase

  setup do
    @kind = Fabricate(:kind)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kinds)
    assert_select '#unexpected_error', false
    assert_template "kinds/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:kind)
    assert_select '#unexpected_error', false
    assert_template "kinds/new"
  end

  test "should create kind" do
    assert_difference('Kind.count') do
      post :create, kind: Fabricate.attributes_for(:kind)
    end

    assert_redirected_to kind_url(assigns(:kind))
  end

  test "should show kind" do
    get :show, id: @kind
    assert_response :success
    assert_not_nil assigns(:kind)
    assert_select '#unexpected_error', false
    assert_template "kinds/show"
  end

  test "should get edit" do
    get :edit, id: @kind
    assert_response :success
    assert_not_nil assigns(:kind)
    assert_select '#unexpected_error', false
    assert_template "kinds/edit"
  end

  test "should update kind" do
    put :update, id: @kind, 
      kind: Fabricate.attributes_for(:kind, attr: 'value')
    assert_redirected_to kind_url(assigns(:kind))
  end

  test "should destroy kind" do
    assert_difference('Kind.count', -1) do
      delete :destroy, id: @kind
    end

    assert_redirected_to kinds_path
  end
end
