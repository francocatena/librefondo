require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase

  setup do
    @payment = Fabricate(:payment)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
    assert_select '#unexpected_error', false
    assert_template "payments/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:payment)
    assert_select '#unexpected_error', false
    assert_template "payments/new"
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: Fabricate.attributes_for(:payment)
    end

    assert_redirected_to payment_url(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
    assert_not_nil assigns(:payment)
    assert_select '#unexpected_error', false
    assert_template "payments/show"
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
    assert_not_nil assigns(:payment)
    assert_select '#unexpected_error', false
    assert_template "payments/edit"
  end

  test "should update payment" do
    put :update, id: @payment, 
      payment: Fabricate.attributes_for(:payment, attr: 'value')
    assert_redirected_to payment_url(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
