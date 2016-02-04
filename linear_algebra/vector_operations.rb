module LinearAlgebra
  class VectorOperations
    class << self
      def add(vector_1, vector_2)
        valid_arguments?(vector_1, vector_2)
        answer = []
        max_index = vector_1.size - 1
        (0..max_index).each do |index|
          answer[index] = vector_1[index] + vector_2[index]
        end
        answer
      end

      def subtract(vector_1, vector_2)
        valid_arguments?(vector_1, vector_2)
        answer = []
        max_index = vector_1.size - 1
        (0..max_index).each do |index|
          answer[index] = vector_1[index] - vector_2[index]
        end
        answer
      end

      def valid_arguments?(vector_1, vector_2)
        fail ArgumentError, 'Vectors length do not match.' if vector_1.size != vector_2.size
      end
    end
  end
end
