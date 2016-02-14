require_relative '../../primes/primes'
require 'test/unit'

class TestCPrimes < Test::Unit::TestCase
  def test_is_prime
    primes_list.each do |prime|
      assert_equal(true, CPrimes.is_prime(prime))
    end
  end

  def test_primes_list
    size = 1000
    list = CPrimes.primes_list(size)
    assert_equal(size, list.size)
  end

  private

  def primes_list
    list = []
    File.open('primes/primes-list.txt').each do |line|
      list << line.to_i
    end
    return list
  end
end
