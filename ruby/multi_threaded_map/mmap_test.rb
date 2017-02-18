require_relative 'mmap'
require 'test/unit'

class TestVector < Test::Unit::TestCase
  def test_mmap
    array = Array.new(1_000) { (rand * 100).to_i }
    ans_1 = array.map { |x| x / 2}
    ans_2 = Mmap.new(array).map { |x| x / 2}
    assert_equal(ans_1, ans_2)
  end

  def test_exhaustive_map
    (1..10_000).each do |number|
      array = Array.new(number) { (rand * 100).to_i }
      ans_1 = array.map { |x| x / 2}
      ans_2 = Mmap.new(array).map { |x| x / 2}
      assert_equal(ans_1, ans_2)
    end
  end
end
