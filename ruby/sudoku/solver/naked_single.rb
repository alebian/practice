module Sudoku
  module Solver
    # This solving technique also known as "singleton" or "lone number" is one of the simplest
    # Sudoku solving techniques. Using this technique the candidate values of an empty cell are
    # determined by examining the values of filled cells in the row, column and box to which the
    # cell belongs. If the empty cell has just one single candidate value then this must be the
    # value of the cell.
    module NakedSingle
      module_function

      def solve!(grid)
        solved = 0
        grid.rows.each do |row|
          row.each do |cell|
            if cell.possible_values.size == 1
              cell.value = cell.possible_values.first
              solved += 1
            end
          end
        end
        raise StandardError, "Can't apply any more moves" if solved == 0
        solved
      end
    end
  end
end
