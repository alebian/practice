module Sudoku
  module Solver
    # I don't know how people actually call this method. It is one that I use when I'm solving
    # them. Basically, in a box, when one cell has a possibility that no other empty cell in that
    # box has, then it means that it must take that value.
    module BoxedSingle
      module_function

      def solve!(grid)
        (0..8).each do |number|
          box = grid.box(number).select { |cell| cell.empty? }
          box.each_with_index do |cell, index|
            other_possibles = _get_other_possibles(box, index)
            cell.possible_values.each do |value|
              next if other_possibles.include?(value)
              cell.value = value
              return 1
            end
          end
        end
        raise StandardError, "Can't apply any more moves"
      end

      def _get_other_possibles(box, current_cell_index)
        possibles = []
        box.each_with_index do |cell, index|
          next if current_cell_index == index
          possibles += cell.possible_values
        end
        possibles
      end
    end
  end
end
