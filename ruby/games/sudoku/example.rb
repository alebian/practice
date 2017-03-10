require_relative 'board/builder'
require_relative 'game'

boards = Sudoku::Board::Builder.multiple_boards('test/fixtures/example_boards.txt')

boards.each do |board|
  sudoku = Sudoku::Game.new(board)
  puts sudoku.grid
  sudoku.naive_solution
end
