require_relative 'cell'

module Sudoku
  module Board
    class Grid
      POSSIBLE_VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze
      POSSIBLE_BOXES = [0, 1, 2, 3, 4, 5, 6, 7, 8].freeze
      attr_reader :rows

      def initialize(array_of_rows)
        @rows = array_of_rows.each_with_object([]) do |row, array|
          array << row.map { |element| Cell.new(element.to_i) }
        end
      end

      def set(row, col, number)
        if rows[row][col].possible_values.include?(number)
          rows[row][col].value = number
          rows[row][col].possible_values = []
        else
          raise ArgumentError, "Number #{number} was not a possible value"
        end
      end

      def has_zeros?
        rows.each do |row|
          row.each do |cell|
            return true if cell.value == 0
          end
        end
        false
      end

      def calculate_possible_values!
        rows.each_with_index do |row, row_idx|
          row.each_with_index do |col, col_idx|
            if col.value != 0
              col.possible_values = []
              col.increase_time_added!
            else
              row_values = row(row_idx)
              col_values = column(col_idx)
              box_values = box_by_position(row_idx, col_idx).map(&:value)
              col.possible_values = POSSIBLE_VALUES - row_values - col_values - box_values
            end
          end
        end
      end

      def to_s
        string = ''
        rows.each_slice(3).to_a.each do |rows_by_3|
          rows_by_3.each do |row|
            row.each_slice(3).to_a.each do |grouped_by_3|
              string += "#{grouped_by_3[0]} #{grouped_by_3[1]} #{grouped_by_3[2]} | "
            end
            string = string[0...-2] + "\n"
          end
          string += "\n"
        end
        string
      end

      def print_possible_values
        rows.each_with_index do |row, row_idx|
          row.each_with_index do |col, col_idx|
            next if col.possible_values.empty?
            puts "Possible values for (#{row_idx}, #{col_idx}) = [#{col.possible_values}]"
          end
        end
      end

      # 0 | 1 | 2
      # 3 | 4 | 5
      # 6 | 7 | 8
      def box(number)
        raise ArgumentError, "Invalid box number #{number}" unless POSSIBLE_BOXES.include?(number)
        send("box_#{number}")
      end

      def box_by_position(row_idx, col_idx)
        if row_idx.between?(0, 2)
          if col_idx.between?(0, 2)
            box(0)
          elsif col_idx.between?(3, 5)
            box(1)
          elsif col_idx.between?(6, 8)
            box(2)
          end
        elsif row_idx.between?(3, 5)
          if col_idx.between?(0, 2)
            box(3)
          elsif col_idx.between?(3, 5)
            box(4)
          elsif col_idx.between?(6, 8)
            box(5)
          end
        elsif row_idx.between?(6, 8)
          if col_idx.between?(0, 2)
            box(6)
          elsif col_idx.between?(3, 5)
            box(7)
          elsif col_idx.between?(6, 8)
            box(8)
          end
        end
      end

      def column(index)
        column = []
        rows.each do |row|
          column << row[index].value
        end
        column
      end

      def row(index)
        rows[index].map { |cell| cell.value }
      end

      def valid?
        (0..8).each do |idx|
          row = row(idx).select { |elem| elem != 0 }
          return false if row.size != row.uniq.size
          col = column(idx).select { |elem| elem != 0 }
          return false if col.size != col.uniq.size
          box = box(idx).select { |elem| elem != 0 }
          return false if box.size != box.uniq.size
        end
        true
      end

      private

      def box_0
        [
          rows[0][0], rows[0][1], rows[0][2],
          rows[1][0], rows[1][1], rows[1][2],
          rows[2][0], rows[2][1], rows[2][2]
        ]
      end

      def box_1
        [
          rows[0][3], rows[0][4], rows[0][5],
          rows[1][3], rows[1][4], rows[1][5],
          rows[2][3], rows[2][4], rows[2][5]
        ]
      end

      def box_2
        [
          rows[0][6], rows[0][7], rows[0][8],
          rows[1][6], rows[1][7], rows[1][8],
          rows[2][6], rows[2][7], rows[2][8]
        ]
      end

      def box_3
        [
          rows[3][0], rows[3][1], rows[3][2],
          rows[4][0], rows[4][1], rows[4][2],
          rows[5][0], rows[5][1], rows[5][2]
        ]
      end

      def box_4
        [
          rows[3][3], rows[3][4], rows[3][5],
          rows[4][3], rows[4][4], rows[4][5],
          rows[5][3], rows[5][4], rows[5][5]
        ]
      end

      def box_5
        [
          rows[3][6], rows[3][7], rows[3][8],
          rows[4][6], rows[4][7], rows[4][8],
          rows[5][6], rows[5][7], rows[5][8]
        ]
      end

      def box_6
        [
          rows[6][0], rows[6][1], rows[6][2],
          rows[7][0], rows[7][1], rows[7][2],
          rows[8][0], rows[8][1], rows[8][2]
        ]
      end

      def box_7
        [
          rows[6][3], rows[6][4], rows[6][5],
          rows[7][3], rows[7][4], rows[7][5],
          rows[8][3], rows[8][4], rows[8][5]
        ]
      end

      def box_8
        [
          rows[6][6], rows[6][7], rows[6][8],
          rows[7][6], rows[7][7], rows[7][8],
          rows[8][6], rows[8][7], rows[8][8]
        ]
      end
    end
  end
end
