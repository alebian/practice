module LinearAlgebra
  class Matrix
    def initialize(array_of_arrays)
      valid_matrix?(array_of_arrays)
      @matrix = array_of_arrays
      @rows = array_of_arrays.size
      @max_row_index = @rows - 1
      @columns = array_of_arrays[0].size
      @max_column_index = @columns - 1
    end

    def column(index)
      valid_index?(index, @max_column_index)
      answer = []
      @matrix.each do |row|
        answer << row[index]
      end
      answer
    end

    def row(index)
      valid_index?(index, @max_row_index)
      @matrix[index].clone
    end

    def multiply(scalar)
      @matrix.each_with_index do |row|
        row.map! { |cell| cell * scalar }
      end
      self
    end

    private

    def valid_matrix?(array_of_arrays)
      size = array_of_arrays[0].size
      array_of_arrays.each do |array|
        fail ArgumentError, 'Rows sizes do not match.' if array.size != size
      end
    end

    def valid_index?(index, expected)
      fail ArgumentError, 'Index out of bounds.' if index > expected
    end
  end
end
