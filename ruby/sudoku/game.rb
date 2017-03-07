require_relative 'solver/naked_single'
require_relative 'solver/boxed_single'

module Sudoku
  class Game
    attr_reader :grid

    def initialize(grid)
      @grid = grid
      @grid.calculate_possible_values!
    end

    # This method only solves puzzles which don't need to think in next moves
    def naive_solution(step_by_step = false)
      while grid.has_zeros?
        naked_single
        print_grid if step_by_step
      end
      raise StandardError, 'Something went wrong!' unless grid.valid?
      unless step_by_step
        grid.calculate_possible_values! # This is to avoid printing the last step
        print_grid
      end
      puts "------ Solved! ------\n\n"
    rescue
      raise StandardError, 'Something went wrong!' unless grid.valid?
      boxed_single
      print_grid if step_by_step
      naive_solution
    end

    private

    def naked_single
      Solver::NakedSingle.solve!(grid)
      grid.calculate_possible_values!
    end

    def boxed_single
      Solver::BoxedSingle.solve!(grid)
      grid.calculate_possible_values!
    end

    def print_grid
      puts "---------------------\n"
      puts grid
    end
  end
end
