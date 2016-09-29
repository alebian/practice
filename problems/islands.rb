#
# Given a matrix with ones and zeros, where 1 represents land, create an algorithm that finds
# how many islands there is in the matrix. We consider islands if non diagonal ones are adjacent.
# Then tell how many lands there are if we change a given 0 to 1.
#
require 'pp'
require 'set'

original_matrix = [
  [1, 0, 1, 1, 1],
  [0, 0, 0, 0, 1],
  [1, 0, 1, 1, 1],
  [0, 1, 0, 0, 0],
  [1, 1, 1, 0, 1]
]

VALID_SYMBOLS = %w(0 1)

def matrix_from_file(path)
  matrix = []
  File.read(path).each_line do |line|
    new_line = []
    line.scan(/\w/).each do |letter|
      raise ArgumentError unless VALID_SYMBOLS.include?(letter)
      new_line << letter.to_i
    end
    matrix << new_line
  end
  matrix
end

class IslandsProblemSolver
  attr_reader :matrix

  def initialize(matrix)
    @matrix = matrix
    @n = matrix[0].size
  end

  def solve
    @current_symbol = 2
    i = j = 0

    while i < @n
      while j < @n
        element = matrix[i][j]
        if element == 1
          changed = change_recursive(i, j)
          @current_symbol += 1 if changed > 0
        end
        j += 1
      end
      j = 0
      i += 1
    end
    @current_symbol - 2
  end

  def join(i, j)
    return @current_symbol - 2 if @matrix[i][j] != 0
    @matrix[i][j] = 'X'
    set = Set.new
    set.add(get(i - 1, j)) if get(i - 1, j) != 0
    set.add(get(i + 1, j)) if get(i + 1, j) != 0
    set.add(get(i, j - 1)) if get(i, j - 1) != 0
    set.add(get(i, j + 1)) if get(i, j + 1) != 0
    @current_symbol - 2 - set.size + 1
  end

  private

  def change_recursive(i, j)
    return 0 if @matrix[i][j] == 0
    @matrix[i][j] = @current_symbol
    changed = 1
    changed += change_recursive(i - 1, j) if change?(i - 1, j)
    changed += change_recursive(i + 1, j) if change?(i + 1, j)
    changed += change_recursive(i, j - 1) if change?(i, j - 1)
    changed += change_recursive(i, j + 1) if change?(i, j + 1)
    changed
  end

  def change?(i, j)
    return false if i < 0 || i >= @n
    return false if j < 0 || j >= @n
    @matrix[i][j] == 1
  end

  def get(i, j)
    return 0 if i < 0 || i >= @n
    return 0 if j < 0 || j >= @n
    @matrix[i][j]
  end
end

matrix = ARGV[0] ? matrix_from_file(ARGV[0]) : original_matrix

solver = IslandsProblemSolver.new(matrix)
puts "Islands: #{solver.solve}"
pp solver.matrix
if ARGV[2]
  puts "Islands if we unite (#{ARGV[1]}, #{ARGV[2]}) -> #{solver.join(ARGV[1].to_i, ARGV[2].to_i)}"
  pp solver.matrix
end
