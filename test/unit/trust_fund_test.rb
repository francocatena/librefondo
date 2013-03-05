require 'test_helper'

class TrustFundTest < ActiveSupport::TestCase
  def setup
    @trust_fund = Fabricate(:trust_fund)
  end

  test 'create' do
    assert_difference ['TrustFund.count'] do
      @trust_fund = TrustFund.create(Fabricate.attributes_for(:trust_fund,
          coupon_tv: 12, coupon_tv_floor: 15, coupon_tv_cap: 17,
          differential_margin: 10, tcpe: 19, minimal_cost: 12,
          maximal_cost: 17
        ))
    end

    assert_equal @trust_fund.coupon_tv, BigDecimal.new("0.12")
    assert_equal @trust_fund.coupon_tv_floor, BigDecimal.new("0.15")
    assert_equal @trust_fund.coupon_tv_cap, BigDecimal.new("0.17")
    assert_equal @trust_fund.differential_margin, BigDecimal.new("0.10")
    assert_equal @trust_fund.tcpe, BigDecimal.new("0.19")
    assert_equal @trust_fund.minimal_cost, BigDecimal.new("0.12")
    assert_equal @trust_fund.maximal_cost, BigDecimal.new("0.17")
  end

  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'TrustFund.count' do
        assert @trust_fund.update_attributes(name: 'Updated')
      end
    end

    assert_equal 'Updated', @trust_fund.reload.name
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('TrustFund.count', -1) { @trust_fund.destroy }
    end
  end
    
  test 'validates blank attributes' do
    @trust_fund.name = ''
    
    assert @trust_fund.invalid?
    assert_equal 1, @trust_fund.errors.size
    assert_equal [error_message_from_model(@trust_fund, :name, :blank)],
      @trust_fund.errors[:name]
  end
    
  test 'validates unique attributes' do
    new_trust_fund = Fabricate(:trust_fund)
    @trust_fund.name = new_trust_fund.name

    assert @trust_fund.invalid?
    assert_equal 1, @trust_fund.errors.size
    assert_equal [error_message_from_model(@trust_fund, :name, :taken)],
      @trust_fund.errors[:name]
  end
end
