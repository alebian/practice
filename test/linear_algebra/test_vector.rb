require_relative '../../linear_algebra/vector'
require 'test/unit'

class TestVectorOperations < Test::Unit::TestCase
  def test_at
    vector = new_vector([3, 5, 7])
    assert_equal(3, vector.at(0))
    assert_equal(5, vector.at(1))
    assert_equal(7, vector.at(2))
    assert_raise { vector.at(3) }
  end

  def test_set
    vector = new_vector([3, 5, 7])
    vector.set(0, 7)
    assert_equal(7, vector.at(0))
    assert_raise { vector.set(3, 8) }
  end

  def test_sum
    vector_1 = new_vector([3, 5, 7])
    vector_2 = new_vector([1, 2, 3])
    expected_vector = new_vector([4, 7, 10])
    assert_equal(expected_vector, vector_1.sum(vector_2))
    assert_equal(expected_vector, vector_1 + vector_2)
    assert_equal(expected_vector, vector_2.sum(vector_1))
    assert_equal(expected_vector, vector_2 + vector_1)
    assert_equal(expected_vector, vector_1.sum!(vector_2))
    assert_raise { vector_1 + new_vector([1,2]) }
  end

  def test_sum_vectors
    vectors =  [new_vector([3, 5, 7]), new_vector([1, 2, 3]), new_vector([5, 8, 15])]
    assert_equal(new_vector([9, 15, 25]), LinearAlgebra::Vector.sum_vectors(vectors))
    assert_raise { LinearAlgebra::Vector.vector_mean(vectors << [1, 7]) }
  end

  def test_vector_mean
    vectors =  [new_vector([3, 5, 10]), new_vector([1, 2, 5]), new_vector([5, 8, 15])]
    assert_equal(new_vector([3.0, 5.0, 10.0]), LinearAlgebra::Vector.vector_mean(vectors))
    assert_raise { LinearAlgebra::Vector.vector_mean(vectors << [1, 7]) }
  end

  def test_subtract
    vector_1 = new_vector([3, 5, 7])
    vector_2 = new_vector([1, 2, 3])
    expected_vector = new_vector([4, 7, 10])
    assert_equal(new_vector([2, 3, 4]), vector_1.subtract(vector_2))
    assert_equal(new_vector([2, 3, 4]), vector_1 - vector_2)
    assert_equal(new_vector([-2, -3, -4]), vector_2.subtract(vector_1))
    assert_equal(new_vector([-2, -3, -4]), vector_2 - vector_1)
    assert_equal(new_vector([2, 3, 4]), vector_1.subtract!(vector_2))
    assert_raise { vector_1 - new_vector([1,2]) }
  end

  def test_equals
    vector_1 = new_vector([3, 5, 7])
    vector_2 = new_vector([3, 5, 7])
    assert_equal(vector_2, vector_1)
    assert_equal(vector_1, vector_2)
    assert_raise { vector_1 == new_vector([1, 2]) }
  end

  def test_multiply
    vector = new_vector([3, 5, 7])
    assert_equal(new_vector([21, 35, 49]), vector.multiply(7))
  end

  def test_dot_product
    vector_1 = new_vector([3, 5, 7])
    vector_2 = new_vector([2, 6, 8])
    assert_equal(92, vector_1.dot_product(vector_2))
    assert_raise { vector_1.dot_product(new_vector([1, 2])) }
  end

  def test_sum_of_squares
    vector = new_vector([3, 5, 7])
    assert_equal(83, vector.sum_of_squares)
  end

  def test_magnitude
    vector = new_vector([3, 5, 7])
    assert_equal(Math.sqrt(83), vector.magnitude)
  end

  def test_squared_distance
    vector_1 = new_vector([3, 5, 7])
    vector_2 = new_vector([2, 6, 8])
    assert_equal(3, vector_1.squared_distance(vector_2))
  end

  def test_distance
    vector_1 = new_vector([3, 5, 7])
    vector_2 = new_vector([-1, 6, 8])
    assert_equal(4.242640687119285, vector_1.distance(vector_2))
  end

  private

  def new_vector(array)
    LinearAlgebra::Vector.new(array)
  end
end
