require 'colorize'

module Sudoku
  module Board
    class Cell
      attr_accessor :value, :possible_values, :time_added

      def initialize(value)
        @value = value
        @time_added = 0
      end

      def to_s
        return value.to_s.red if time_added == 1
        return value.to_s.yellow if empty?
        value.to_s.green
      end

      def empty?
        value == 0
      end

      def equals?(cell)
        cell.value == value
      end

      def increase_time_added!
        @time_added += 1
      end
    end
  end
end
