require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def setup
    @payment = Fabricate(:payment)
  end

  test 'create' do
    assert_difference ['Payment.count'] do
      @payment = Payment.create(Fabricate.attributes_for(:payment))
    end 
  end
    
  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'Payment.count' do
        assert @payment.update_attributes(pay_day: 31)
      end
    end

    assert_equal 31, @payment.reload.pay_day
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('Payment.count', -1) { @payment.destroy }
    end
  end
end
