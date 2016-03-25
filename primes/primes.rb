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
    generator = Primes::Generator.new
    size.times { answer << generator.next }
    answer
  end

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
