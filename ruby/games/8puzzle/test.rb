require_relative 'board'

EASY_GRID = {
  T1: 1, T2: 2, T3: 3,
  T4: 0, T5: 4, T6: 6,
  T7: 7, T8: 5, T9: 8
}

UNSOLVABLE_BOARD = {
  T1: 1, T2: 2, T3: 3,
  T4: 4, T5: 5, T6: 6,
  T7: 8, T8: 7, T9: 0
}

# board = EightPuzzle::Board.new(EASY_GRID)
# board = EightPuzzle::Board.new(UNSOLVABLE_BOARD)
current_board = EightPuzzle::Board.generate_random

def print_board(board)
  puts "#{board.to_s}\n"
end

begin
  winning = current_board.solve

  print_board(current_board)
  winning.previous_movements.each do |move|
    current_board = current_board.move(move)
    print_board(current_board)
  end

rescue EightPuzzle::UnsolvableBoardError => e
  print_board(current_board)
  puts "The board was insolvable. Number of inversions: #{e.inversions}"
end
