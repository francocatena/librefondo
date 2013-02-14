require 'test_helper'

class StockTest < ActiveSupport::TestCase
  def setup
    @stock = Fabricate(:stock)
  end

  test 'create' do
    assert_difference ['Stock.count', 'Version.count'] do
      @stock = Stock.create(Fabricate.attributes_for(:stock))
    end 
  end
    
  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'Stock.count' do
        assert @stock.update_attributes(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @stock.reload.attr
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('Stock.count', -1) { @stock.destroy }
    end
  end
    
  test 'validates blank attributes' do
    @stock.attr = ''
    
    assert @stock.invalid?
    assert_equal 1, @stock.errors.size
    assert_equal [error_message_from_model(@stock, :attr, :blank)],
      @stock.errors[:attr]
  end
    
  test 'validates unique attributes' do
    new_stock = Fabricate(:stock)
    @stock.attr = new_stock.attr

    assert @stock.invalid?
    assert_equal 1, @stock.errors.size
    assert_equal [error_message_from_model(@stock, :attr, :taken)],
      @stock.errors[:attr]
  end
end
