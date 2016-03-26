class Primes
  def self.prime?(number)
    return false if number <= 1
    return true if number == 2
    maximum = Math.sqrt(number).to_i + 1
    (2..maximum).each do |i|
      return false if number % i == 0
    end
    true
  end

  def self.list(size)
    answer = []
    return answer if size < 1
    gen = generator
    size.times { answer << gen.next }
    answer
  end

  def self.generator
    Primes::Generator.new
  end

  def self.decomposition(number)
    decomposition = { 1 => 1}
    aux = number.abs.to_i
    return decomposition if aux < 2
    gen = generator
    break_condition = Math.sqrt(aux).to_i + 1
    while aux > 1
      current_prime = gen.next
      if current_prime > break_condition
        # We reached the biggest prime in the decomposition (which is now 'aux')
        decomposition[aux] = 1
        return decomposition
      end
      while aux % current_prime == 0 || aux == current_prime
        if decomposition.key?(current_prime)
          decomposition[current_prime] += 1
        else
          decomposition[current_prime] = 1
        end
        aux /= current_prime
      end
    end
    decomposition
  end

  def self.compose(decomposition)
    result = 1
    decomposition.each do |prime, power|
      result *= prime**power
    end
    result
  end

  private

  class Generator
    def initialize
      @last_prime = nil
      @next_candidate = nil
    end

    def next
      if @last_prime.nil?
        @next_candidate = 3
        @last_prime = 2
      else
        while !Primes.prime?(@next_candidate)
          @next_candidate += 2
        end
        answer = @next_candidate
        @next_candidate += 2
        answer
      end
    end
  end
end
