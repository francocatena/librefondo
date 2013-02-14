require 'test_helper'

class FundTest < ActiveSupport::TestCase
  def setup
    @fund = Fabricate(:fund)
  end

  test 'create' do
    assert_difference ['Fund.count', 'Version.count'] do
      @fund = Fund.create(Fabricate.attributes_for(:fund))
    end 
  end
    
  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'Fund.count' do
        assert @fund.update_attributes(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @fund.reload.attr
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('Fund.count', -1) { @fund.destroy }
    end
  end
    
  test 'validates blank attributes' do
    @fund.attr = ''
    
    assert @fund.invalid?
    assert_equal 1, @fund.errors.size
    assert_equal [error_message_from_model(@fund, :attr, :blank)],
      @fund.errors[:attr]
  end
    
  test 'validates unique attributes' do
    new_fund = Fabricate(:fund)
    @fund.attr = new_fund.attr

    assert @fund.invalid?
    assert_equal 1, @fund.errors.size
    assert_equal [error_message_from_model(@fund, :attr, :taken)],
      @fund.errors[:attr]
  end
end
