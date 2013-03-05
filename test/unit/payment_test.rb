require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def setup
    @trust_fund = TrustFund.create(Fabricate.attributes_for(:trust_fund, 
      broadcast_cost: 10000, tcpe: 10, base: 365 
    ))

    @payment = Payment.create(Fabricate.attributes_for(:payment, 
      trust_fund_id: @trust_fund.id, amortization: 1000, 
      date: Date.today, pay_day: 30
    ))
  end

  test 'create' do
    assert_difference 'Payment.count' do
      @payment = Fabricate(:payment)
    end 

    assert @payment.persisted?
  end
  
  test 'verify existing attributes' do 
    assert_equal BigDecimal.new("0.9"), @payment.residual_value
    assert_equal BigDecimal.new("0.1"), @payment.estimated_amount
    assert_equal "0.00822", '%.5f' % @payment.period_rate
    assert_equal "0.00008", '%.5f' % @payment.net_value
  end

  test 'create with more payments' do
    assert_difference 'Payment.count' do
       @payment = Payment.create(Fabricate.attributes_for(:payment, 
        trust_fund_id: @trust_fund.id, amortization: 1000, 
        date: 1.month.from_now, pay_day: 30
      ))     
    end

    assert_equal BigDecimal.new("0.8"), @payment.residual_value
    assert_equal BigDecimal.new("0.1"), @payment.estimated_amount
    assert_equal "0.00822", '%.5f' % @payment.period_rate
    assert_equal "0.00007", '%.5f' % @payment.net_value
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
