require_relative '../../../../lists/immutable/strong_typed/single_linked_list'
require 'test/unit'

class TestSingleLinkedList < Test::Unit::TestCase
  def test_initialize
    array = [1, 2]
    list = Immutable::StrongTyped::SingleLinkedList.new(array)
    assert(!list.equal?(Immutable::StrongTyped::SingleLinkedList.new(array)))
    assert_raise { Immutable::StrongTyped::SingleLinkedList.new([1, 'test']) }
  end

  def test_first
    array = [4, 5, 6]
    list = Immutable::StrongTyped::SingleLinkedList.new(array)
    assert_equal(4, list.first)
    array_of_arrays = [[1, 2], [3, 4]]
    list_of_arrays = Immutable::StrongTyped::SingleLinkedList.new(array_of_arrays)
    assert_equal(array_of_arrays[0], list_of_arrays.first)
    assert(!array_of_arrays[0].equal?(list_of_arrays.first))
  end

  def test_last

  end

  def test_add

  end

  def test_to_a

  end

  def test_inject

  end

  def test_each

  end
end
