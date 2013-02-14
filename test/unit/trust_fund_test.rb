require 'test_helper'

class TrustFundTest < ActiveSupport::TestCase
  def setup
    @trust_fund = Fabricate(:trust_fund)
  end

  test 'create' do
    assert_difference ['TrustFund.count', 'Version.count'] do
      @trust_fund = TrustFund.create(Fabricate.attributes_for(:trust_fund))
    end 
  end
    
  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'TrustFund.count' do
        assert @trust_fund.update_attributes(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @trust_fund.reload.attr
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('TrustFund.count', -1) { @trust_fund.destroy }
    end
  end
    
  test 'validates blank attributes' do
    @trust_fund.attr = ''
    
    assert @trust_fund.invalid?
    assert_equal 1, @trust_fund.errors.size
    assert_equal [error_message_from_model(@trust_fund, :attr, :blank)],
      @trust_fund.errors[:attr]
  end
    
  test 'validates unique attributes' do
    new_trust_fund = Fabricate(:trust_fund)
    @trust_fund.attr = new_trust_fund.attr

    assert @trust_fund.invalid?
    assert_equal 1, @trust_fund.errors.size
    assert_equal [error_message_from_model(@trust_fund, :attr, :taken)],
      @trust_fund.errors[:attr]
  end
end
