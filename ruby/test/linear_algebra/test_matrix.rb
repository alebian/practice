require_relative '../../linear_algebra/matrix'
require 'test/unit'

class TestMatrix < Test::Unit::TestCase
  def test_initialize
    assert_raise { LinearAlgebra::Matrix.new([[1, 2, 3], [1, 2]]) }
  end

  def test_row
    matrix = new_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    assert_equal([1, 2, 3], matrix.row(0))
    assert_equal([4, 5, 6], matrix.row(1))
    assert_equal([7, 8, 9], matrix.row(2))
    assert_raise { matrix.row(3) }
  end

  def test_column
    matrix = new_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    assert_equal([1, 4, 7], matrix.column(0))
    assert_equal([2, 5, 8], matrix.column(1))
    assert_equal([3, 6, 9], matrix.column(2))
    assert_raise { matrix.column(3) }
  end

  def test_multiply
    matrix = new_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]]).multiply(0.5)
    assert_equal([0.5, 1, 1.5], matrix.row(0))
    assert_equal([2, 2.5, 3], matrix.row(1))
    assert_equal([3.5, 4, 4.5], matrix.row(2))
    assert_raise { matrix.multiply('hello') }
  end

  private

  def new_matrix(array_of_arrays)
    LinearAlgebra::Matrix.new(array_of_arrays)
  end
end
