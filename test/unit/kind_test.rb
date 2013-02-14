require 'test_helper'

class KindTest < ActiveSupport::TestCase
  def setup
    @kind = Fabricate(:kind)
  end

  test 'create' do
    assert_difference ['Kind.count', 'Version.count'] do
      @kind = Kind.create(Fabricate.attributes_for(:kind))
    end 
  end
    
  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'Kind.count' do
        assert @kind.update_attributes(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @kind.reload.attr
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('Kind.count', -1) { @kind.destroy }
    end
  end
    
  test 'validates blank attributes' do
    @kind.attr = ''
    
    assert @kind.invalid?
    assert_equal 1, @kind.errors.size
    assert_equal [error_message_from_model(@kind, :attr, :blank)],
      @kind.errors[:attr]
  end
    
  test 'validates unique attributes' do
    new_kind = Fabricate(:kind)
    @kind.attr = new_kind.attr

    assert @kind.invalid?
    assert_equal 1, @kind.errors.size
    assert_equal [error_message_from_model(@kind, :attr, :taken)],
      @kind.errors[:attr]
  end
end
