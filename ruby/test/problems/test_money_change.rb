require_relative '../../problems/money_change'
require 'test/unit'

class TestMoneyChange < Test::Unit::TestCase
  def test_calculate_change
    changer = MoneyChange.new
    result = changer.calculate_change(18941.46)
    assert_equal({100 => 189, 20 => 2, 1 => 1, 0.2 => 2, 0.05 => 1, 0.01 => 1, remaining: 0.0}, result)
  end
end
