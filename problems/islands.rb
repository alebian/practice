#
# Given a matrix with ones and zeros, where 1 represents land, create an algorithm that finds
# how many islands there is in the matrix. We consider islands if non diagonal ones are adjacent.
# Then tell how many lands there are if we change a given 0 to 1.
#
require 'pp'
require 'set'

ORIGINAL_MATRIX = [
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

Point = Struct.new(:x, :y)

class IslandsProblemSolver
  attr_reader :matrix

  def initialize(matrix)
    @matrix = matrix
    @n = matrix[0].size
  end

  def solve
    @current_symbol = 2
    @matrix.each_with_index do |row, i|
      row.each_with_index do |element, j|
        if element == 1
          changed = change_recursive(Point.new(i, j))
          @current_symbol += 1 if changed > 0
        end
      end
    end
    @current_symbol - 2
  end

  def join(point)
    return @current_symbol - 2 if @matrix[point.x][point.y] != 0
    @matrix[point.x][point.y] = 'X'
    set = Set.new
    set.add(get(up(point))) if get(up(point)) != 0
    set.add(get(down(point))) if get(down(point)) != 0
    set.add(get(left(point))) if get(left(point)) != 0
    set.add(get(right(point))) if get(right(point)) != 0
    @current_symbol - 2 - set.size + 1
  end

  private

    def change_recursive(point)
      return 0 if get(point) == 0
      @matrix[point.x][point.y] = @current_symbol
      changed = 1
      changed += change_recursive(up(point)) if change?(up(point))
      changed += change_recursive(down(point)) if change?(down(point))
      changed += change_recursive(left(point)) if change?(left(point))
      changed += change_recursive(right(point)) if change?(right(point))
      changed
    end

    def change?(point)
      get(point) == 1
    end

    def get(point)
      return 0 if invalid_position?(point.x)
      return 0 if invalid_position?(point.y)
      @matrix[point.x][point.y]
    end

    def invalid_position?(position)
      position < 0 || position >= @n
    end

    def up(point)
      Point.new(point.x - 1, point.y)
    end

    def down(point)
      Point.new(point.x + 1, point.y)
    end

    def left(point)
      Point.new(point.x, point.y - 1)
    end

    def right(point)
      Point.new(point.x, point.y + 1)
    end
end

matrix = ARGV[0] ? matrix_from_file(ARGV[0]) : ORIGINAL_MATRIX

solver = IslandsProblemSolver.new(matrix)
puts "Islands: #{solver.solve}"
pp solver.matrix
point = Point.new(ARGV[1].to_i, ARGV[2].to_i)
if ARGV[2]
  puts "Islands if we unite (#{ARGV[1]}, #{ARGV[2]}) -> #{solver.join(point)}"
  pp solver.matrix
end
