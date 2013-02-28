require 'test_helper'

class FundersTest < ActiveSupport::TestCase
  def setup
    @funder = Fabricate(:funder)
  end

  test 'create' do
    assert_difference ['Funders.count', 'Version.count'] do
      @funder = Funders.create(Fabricate.attributes_for(:funder))
    end 
  end
    
  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'Funders.count' do
        assert @funder.update_attributes(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @funder.reload.attr
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('Funders.count', -1) { @funder.destroy }
    end
  end
    
  test 'validates blank attributes' do
    @funder.attr = ''
    
    assert @funder.invalid?
    assert_equal 1, @funder.errors.size
    assert_equal [error_message_from_model(@funder, :attr, :blank)],
      @funder.errors[:attr]
  end
    
  test 'validates unique attributes' do
    new_funder = Fabricate(:funder)
    @funder.attr = new_funder.attr

    assert @funder.invalid?
    assert_equal 1, @funder.errors.size
    assert_equal [error_message_from_model(@funder, :attr, :taken)],
      @funder.errors[:attr]
  end
end
