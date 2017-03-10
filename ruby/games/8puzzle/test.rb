require_relative 'board'

EASY_GRID = {
  T1: 1, T2: 3, T3: 0,
  T4: 8, T5: 2, T6: 4,
  T7: 7, T8: 6, T9: 5
}

# board = EightPuzzle::Board.new(EASY_GRID)
board = EightPuzzle::Board.generate_random

winning = board.solve

current_board = board
puts "#{current_board.to_s}\n"
winning.previous_movements.each do |move|
  current_board = current_board.move(move)
  puts "#{current_board.to_s}\n"
end
