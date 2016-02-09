module LinearAlgebra
  class Vector
    attr_reader :size

    def initialize(array = [])
      @array = array
      @size = array.size
      @max_index = size - 1
    end

    def at(index)
      valid_index?(index)
      @array[index]
    end

    def set(index, value)
      valid_index?(index)
      @array[index] = value
    end

    def +(vector)
      sum(vector)
    end

    def sum(vector)
      valid_argument?(vector)
      copy_array = @array.clone
      (0..@max_index).each do |index|
        copy_array[index] += vector.at(index)
      end
      Vector.new(copy_array)
    end

    def sum!(vector)
      valid_argument?(vector)
      (0..@max_index).each do |index|
        @array[index] += vector.at(index)
      end
      self
    end

    def self.sum_vectors(vectors)
      answer = Vector.new(Array.new(vectors[0].size, 0))
      vectors.each do |vector|
        answer.sum!(vector)
      end
      answer
    end

    def -(vector)
      subtract(vector)
    end

    def subtract(vector)
      valid_argument?(vector)
      copy_array = @array.clone
      (0..@max_index).each do |index|
        copy_array[index] -= vector.at(index)
      end
      Vector.new(copy_array)
    end

    def subtract!(vector)
      valid_argument?(vector)
      (0..@max_index).each do |index|
        @array[index] -= vector.at(index)
      end
      self
    end

    def ==(vector)
      valid_argument?(vector)
      (0..@max_index).each do |index|
        return false if @array[index] != vector.at(index)
      end
      true
    end

    def multiply(scalar)
      @array.map! { |element| element * scalar }
      self
    end

    def dot_product(vector)
      valid_argument?(vector)
      answer = 0.0
      (0..@max_index).each do |index|
        answer += @array[index] * vector.at(index)
      end
      answer
    end

    def self.vector_mean(vectors)
      sum_vectors(vectors).multiply(1.0 / vectors.size)
    end

    def sum_of_squares
      dot_product(self)
    end

    def magnitude
      Math.sqrt(sum_of_squares)
    end

    def squared_distance(vector)
      valid_argument?(vector)
      subtract(vector).sum_of_squares
    end

    def distance(vector)
      valid_argument?(vector)
      subtract(vector).magnitude
    end

    private

    def valid_index?(index)
      fail ArgumentError, 'Index out of bounds.' if index > @max_index || index < 0
    end

    def valid_argument?(vector)
      fail ArgumentError, 'Vectors length do not match.' if size != vector.size
    end
  end
end
