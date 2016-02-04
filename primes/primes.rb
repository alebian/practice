module Primes
  def self.is_prime(number)
    return false if number <= 1
    return true if number == 2
    maximum = Math.sqrt(number).to_i + 1
    (2..maximum).each do |i|
      return false if number % i == 0
    end
    true
  end

  def self.primes_list(size)
    answer = []
    prime = 2
    while size > 0
      while !is_prime(prime)
        prime += 1
      end
      answer << prime
      size -= 1
    end
    answer
  end

  def self.prime_decomposition(number)
    # decomposition = {}
    # number = number.to_i
    # return decomposition if numer < 2
    # gen = primes_gen()
    # break_condition = int(math.sqrt(number))
    # while number > 1:
    #     current_prime = next(gen)
    #     if current_prime > break_condition:
    #         decomposition[number] = 1
    #         return decomposition
    #     while number % current_prime == 0 or number == current_prime:
    #         if current_prime in decomposition:
    #             decomposition[current_prime] += 1
    #         else:
    #             decomposition[current_prime] = 1
    #         number /= current_prime
    # decomposition
  end

  def self.get_from_decomposition(decomposition)
    # result = 1
    # decomposition.each do |prime|
    #   result *= prime**decomposition[prime]
    # end
    # result
  end
end
