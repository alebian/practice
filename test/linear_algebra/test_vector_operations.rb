require_relative '../../linear_algebra/vector_operations'
require 'test/unit'

class TestVectorOperations < Test::Unit::TestCase
  def test_add
    vector_1 = [3, 5, 7]
    vector_2 = [1, 2, 3]
    expected = [4, 7, 10]
    assert_equal(expected, LinearAlgebra::VectorOperations.add(vector_1, vector_2))
    assert_equal(expected, LinearAlgebra::VectorOperations.add(vector_2, vector_1))
    assert_raise do
      LinearAlgebra::VectorOperations.add(vector_1, [1, 2])
    end
  end

  def test_subtract
    vector_1 = [3, 5, 7]
    vector_2 = [1, 2, 3]
    assert_equal([2, 3, 4], LinearAlgebra::VectorOperations.subtract(vector_1, vector_2))
    assert_equal([-2, -3, -4], LinearAlgebra::VectorOperations.subtract(vector_2, vector_1))
    assert_raise do
      LinearAlgebra::VectorOperations.add(vector_1, [1, 2])
    end
  end
end
