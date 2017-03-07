require_relative 'grid'

module Sudoku
  module Board
    module Builder
      module_function

      def multiple_boards(path)
        file = File.open(path)
        boards = []
        file.each_line { |line| boards << single_board(line) }
        boards
      end

      def single_board(string)
        rows = string.chomp.split('').map(&:to_i).each_slice(9).to_a
        Grid.new(rows)
      end
    end
  end
end
