class CollatzConjecture
  def self.calculate(number)
    number = number.abs.to_i
    raise ArgumentError if number <= 1
    answer = number.to_s + ', '
    while number > 1
      if number % 2 == 0
        number = number / 2
      else
        number = (number * 3) + 1
      end
      answer += number.to_s + ', '
    end
    answer
  end

  # Calculate the sequence for every number up to max
  def self.up_to(max)
    max = max.abs.to_i
    raise ArgumentError if max <= 1
    partial_results = {}

    # Use partial results to avoid unnecessary calculations
    # Start from the smaller number so more partial results are used
    current = 2
    while current <= max

      aux_number = current
      aux_string = aux_number.to_s + ', '
      while aux_number > 1
        if aux_number % 2 == 0
          aux_number = aux_number / 2
        else
          aux_number = (aux_number * 3) + 1
        end
        if partial_results.key?(aux_number)
          aux_string += partial_results[aux_number]
          break
        else
          aux_string += aux_number.to_s + ', '
        end
      end
      partial_results[current] = aux_string

      current += 1
    end
    partial_results
  end
end
