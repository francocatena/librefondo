require 'test_helper'

class FunderTest < ActiveSupport::TestCase
  def setup
    @funder = Fabricate(:funder)
  end

  test 'create' do
    assert_difference ['Funder.count'] do
      @funder = Funder.create(Fabricate.attributes_for(:funder))
    end 
  end
    
  test 'destroy' do 
    assert_difference 'Version.count' do
      assert_difference('Funder.count', -1) { @funder.destroy }
    end
  end
end
