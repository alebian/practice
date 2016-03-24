require_relative '../../../../lists/immutable/strong_typed/single_linked_list'
require 'test/unit'

class TestSingleLinkedList < Test::Unit::TestCase
  def test_initialize
    array = [1, 2]
    list = Immutable::StrongTyped::SingleLinkedList.new(array)
    assert(!list.equal?(Immutable::StrongTyped::SingleLinkedList.new(array)))
    assert_raise { Immutable::StrongTyped::SingleLinkedList.new([1, 'test']) }
    assert_equal(0, Immutable::StrongTyped::SingleLinkedList.new.size)
    assert_equal(array[0].class.to_s, list.type)
    assert_equal(nil, Immutable::StrongTyped::SingleLinkedList.new.type)
  end

  def test_first
    array = [4, 5, 6]
    list = Immutable::StrongTyped::SingleLinkedList.new(array)
    assert_equal(4, list.first)
    array[0] = 35
    assert_equal(array[0], 35)
    assert_equal(4, list.first)
    assert_equal(array[0].class.to_s, list.type)

    array_of_arrays = [[1, 2], [3, 4]]
    list_of_arrays = Immutable::StrongTyped::SingleLinkedList.new(array_of_arrays)
    assert_equal(array_of_arrays[0], list_of_arrays.first)
    assert(!array_of_arrays[0].equal?(list_of_arrays.first))
    assert_equal(array_of_arrays[0].class.to_s, list_of_arrays.type)
    array_of_arrays[0] = 4
    assert_equal(array_of_arrays, [4, [3, 4]])
    assert_equal(list_of_arrays.first, [1, 2])
  end

  def test_last_with_one_element
    array = [4]
    list = Immutable::StrongTyped::SingleLinkedList.new(array)
    assert_equal(4, list.last)
    array[0] = 35
    assert_equal(array, [35])
    assert_equal(4, list.last)
  end

  def test_last
    array = [4, 5, 6]
    list = Immutable::StrongTyped::SingleLinkedList.new(array)
    assert_equal(6, list.last)
    array[2] = 35
    assert_equal(array, [4, 5, 35])
    assert_equal(6, list.last)
  end

  def test_at
    array = [4, 5, 6, 7, 8, 9, 10, 11]
    list = Immutable::StrongTyped::SingleLinkedList.new(array)
    array.each_index do |index|
      assert_equal(array[index], list[index])
    end
    assert_equal(nil, list[array.size])
  end

  def test_add
    list_1 = Immutable::StrongTyped::SingleLinkedList.new
    assert(list_1.equal?(list_1))
    assert_equal(nil, list_1.type)
    list_2 = list_1.add(1)
    assert(!list_1.equal?(list_2))
    assert_equal(nil, list_1[0])
    assert_equal(1, list_2[0])
    list_2.add(2)
    assert_equal(nil, list_2[1])
    list_3 = list_2.add(2)
    assert_equal(2, list_3[1])
    list_3 = list_2.add(3).add(4).add(5)
    assert_equal(3, list_3[2])
    assert_equal(4, list_3[3])
    assert_equal(5, list_3[4])
  end

  def test_to_a

  end

  def test_inject

  end

  def test_each

  end
end
