require 'set'
# This is a little experiment:
# Solve the 8 puzzle game using a Hash as a data structure instead of a more "natural" data
# structure like a matrix or vector.
#
# Each tile of the board has names like follows:
#   T1 T2 T3
#   T4 T5 T6
#   T7 T8 T9
#
module EightPuzzle
  class InvalidMoveError < StandardError ; end

  class UnsolvableBoardError < StandardError
    attr_reader :inversions

    def initialize(inversions)
      @inversions = inversions
    end
  end

  class Board
    KEYS = [:T1, :T2, :T3, :T4, :T5, :T6, :T7, :T8, :T9]

    WINNING_GRID = {
      T1: 1, T2: 2, T3: 3,
      T4: 4, T5: 5, T6: 6,
      T7: 7, T8: 8, T9: 0
    }

    VALID_MOVEMENTS = {
      T1: [:T2, :T4],
      T2: [:T1, :T3, :T5],
      T3: [:T2, :T6],
      T4: [:T1, :T5, :T7],
      T5: [:T2, :T4, :T6, :T8],
      T6: [:T3, :T5, :T9],
      T7: [:T4, :T8],
      T8: [:T5, :T7, :T9],
      T9: [:T6, :T8]
    }

    def self.generate_random
      numbers = (0..8).to_a
      grid = {}
      KEYS.each do |key|
        num = numbers.sample
        numbers.delete(num)
        grid[key] = num
      end
      check_if_solvable!(grid)
      self.new(grid)
    rescue
      generate_random
    end

    attr_reader :previous_movements, :grid

    def initialize(grid, previous_movements = [])
      @grid = grid
      @previous_movements = previous_movements
      grid.each do |k, v|
        if v == 0
          @zero_position = k
          break
        end
      end
    end

    def to_s
      answer = ''
      KEYS.each_slice(3) do |by_3|
        by_3.each { |key| answer += "#{@grid[key] == 0 ? ' ' : @grid[key]} " }
        answer += "\n"
      end
      answer
    end

    def ==(board)
      @grid == board.grid
    end

    def eql?(board)
      board == self
    end

    def hash
      @grid.hash
    end

    def finished?
      @grid == WINNING_GRID
    end

    def move(new_position)
      raise InvalidMoveError unless valid_movements.include?(new_position)
      new_grid = @grid.clone
      new_grid[new_position] = 0
      new_grid[@zero_position] = @grid[new_position]
      self.class.new(new_grid, @previous_movements.clone << new_position)
    end

    def solve
      Board.check_if_solvable!(@grid)
      # BFS
      already_checked = Set.new
      queue = []
      queue.push(self)
      while !queue.empty?
        current = queue.shift
        return current if current.finished?
        current.next_moves.each do |move|
          queue.push(move) unless queue.include?(move) || already_checked.include?(move)
        end
        already_checked.add(current)
      end
    end

    def next_moves
      valid_movements.each_with_object([]) do |key, array|
        array << move(key)
      end
    end

    private

    def self.check_if_solvable!(grid)
      numbers = []
      KEYS.each do |key|
        numbers << grid[key] if grid[key] != 0
      end
      inversions = 0
      for i in (0..6)
        for j in ((i+1)..7)
          inversions += 1 if numbers[i] > numbers[j]
        end
      end
      raise UnsolvableBoardError.new(inversions) if inversions % 2 != 0
    end

    def valid_movements
      VALID_MOVEMENTS[@zero_position]
    end
  end
end
