require_relative '../../primes/primes'
require_relative '../../primes/c_primes'
require 'test/unit'

class TestPrimesImplementations < Test::Unit::TestCase
  def test_is_prime
    primes = [0, 2, 3, 5, 17, 22_801_761_391, 22_801_763_489]
    primes.each do |prime|
      assert_equal(Primes.is_prime(prime), CPrimes.is_prime(prime))
    end
  end

  def test_prime_list
    size = 100_000
    list = Primes.primes_list(size)
    c_list = CPrimes.primes_list(size)
    assert_equal(list, c_list)
  end
end
