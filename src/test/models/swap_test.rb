require 'test_helper'

class SwapTest < ActiveSupport::TestCase
  setup do
    @swap = Swap.new( taker_id: 1, shift_id: 1)
  end

  test "should save valid swap" do
    assert @swap.save, "did not save valid swap"
  end
  
end
