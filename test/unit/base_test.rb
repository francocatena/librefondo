require 'test_helper'

class BaseTest < ActiveSupport::TestCase
  def setup
    @basis = Fabricate(:basis)
  end

  test 'create' do
    assert_difference ['Base.count', 'Version.count'] do
      @basis = Base.create(Fabricate.attributes_for(:basis))
    end 
  end
    
  test 'update' do
    assert_difference 'Version.count' do
      assert_no_difference 'Base.count' do
        assert @basis.update_attributes(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @basis.reload.attr
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('Base.count', -1) { @basis.destroy }
    end
  end
    
  test 'validates blank attributes' do
    @basis.attr = ''
    
    assert @basis.invalid?
    assert_equal 1, @basis.errors.size
    assert_equal [error_message_from_model(@basis, :attr, :blank)],
      @basis.errors[:attr]
  end
    
  test 'validates unique attributes' do
    new_basis = Fabricate(:basis)
    @basis.attr = new_basis.attr

    assert @basis.invalid?
    assert_equal 1, @basis.errors.size
    assert_equal [error_message_from_model(@basis, :attr, :taken)],
      @basis.errors[:attr]
  end
end
