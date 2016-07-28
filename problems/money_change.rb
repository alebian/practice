require 'bigdecimal'

class MoneyChange
  def initialize(values = [100, 50, 20, 10, 5, 1, 0.5, 0.2, 0.1, 0.05, 0.01])
    @values = values.sort.reverse
  end

  def calculate_change(money)
    number = BigDecimal.new(money.to_s)
    answer = {}
    return answer if number < @values.last
    current_idx = 0
    while number >= @values.last
      if number >= @values[current_idx]
        add_hash(@values[current_idx], answer)
        number -= @values[current_idx]
      else
        current_idx += 1
        break if current_idx == @values.size
      end
    end
    answer.merge(remaining: number.to_f)
  end

  private

  def add_hash(key, hash)
    hash[key] = 0 unless hash.key?(key)
    hash[key] = hash[key] + 1
  end
end
