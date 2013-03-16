require 'minitest_helper'

class PaymentsControllerTest < ActionController::TestCase

  setup do
    @payment = Fabricate(:payment)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get more info" do
    xhr :get, :more_info, payment_id: @payment.to_param
    assert_response :success
    assert_not_nil assigns(:payment)
    assert_select '#unexpected_error', false
    assert_template "payments/_more_info"
  end
end
