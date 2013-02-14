require 'test_helper'

class RateTest < ActiveSupport::TestCase
  def setup
    @rate = Fabricate(:rate)
  end

  test 'create' do
    assert_difference ['Rate.count', 'Version.count'] do
      @rate = Rate.create(Fabricate.attributes_for(:rate))
    end 
  end
    
  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'Rate.count' do
        assert @rate.update_attributes(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @rate.reload.attr
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('Rate.count', -1) { @rate.destroy }
    end
  end
    
  test 'validates blank attributes' do
    @rate.attr = ''
    
    assert @rate.invalid?
    assert_equal 1, @rate.errors.size
    assert_equal [error_message_from_model(@rate, :attr, :blank)],
      @rate.errors[:attr]
  end
    
  test 'validates unique attributes' do
    new_rate = Fabricate(:rate)
    @rate.attr = new_rate.attr

    assert @rate.invalid?
    assert_equal 1, @rate.errors.size
    assert_equal [error_message_from_model(@rate, :attr, :taken)],
      @rate.errors[:attr]
  end
end
