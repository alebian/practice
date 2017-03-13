require_relative '../../../games/8puzzle/board'
require 'test/unit'
require 'set'

class TestBoard < Test::Unit::TestCase
  UNSOLVABLE_BOARD = {
    T1: 1, T2: 2, T3: 3,
    T4: 4, T5: 5, T6: 6,
    T7: 8, T8: 7, T9: 0
  }

  EASY_GRID = {
    T1: 1, T2: 2, T3: 3,
    T4: 0, T5: 4, T6: 6,
    T7: 7, T8: 5, T9: 8
  }

  def setup
    @easy_board = EightPuzzle::Board.new(EASY_GRID)
  end

  def test_hash
    board1 = EightPuzzle::Board.generate_random
    board2 = EightPuzzle::Board.generate_random
    assert_not_equal(board1.hash, board2.hash)
    board3 = EightPuzzle::Board.new(EASY_GRID)
    board4 = EightPuzzle::Board.new(EASY_GRID)
    assert_equal(board3.hash, board4.hash)
  end

  def test_eql
    random_board = EightPuzzle::Board.generate_random
    assert_equal(false, random_board.eql?(@easy_board))
    assert_equal(false, @easy_board.eql?(random_board))
    assert_equal(false, random_board == @easy_board)
    assert_equal(false, @easy_board == random_board)
    assert_equal(true, random_board.eql?(random_board))
    assert_equal(true, random_board == random_board)
  end

  def test_in_set
    set = Set.new
    board1 = EightPuzzle::Board.generate_random
    set.add(board1)
    set.add(board1)
    assert_equal(1, set.size)
    assert_equal(true, set.include?(board1))
    set.add(@easy_board)
    assert_equal(2, set.size)
  end

  def test_finished?
    finished_board = EightPuzzle::Board.new(EightPuzzle::Board::WINNING_GRID)
    assert_equal(false, @easy_board.finished?)
    assert_equal(true, finished_board.finished?)
  end

  def test_unsolvable
    unsolvable_board = EightPuzzle::Board.new(UNSOLVABLE_BOARD)
    assert_raise { unsolvable_board.solve }
  end

  def test_solve
    solved_board = @easy_board.solve
    assert_equal(true, solved_board.finished?)
  end
end
