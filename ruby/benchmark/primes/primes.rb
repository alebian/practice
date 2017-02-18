require 'benchmark/ips'
require 'benchmark'
require_relative '../../primes/primes'
# require_relative '../../primes/c_primes'

# size = 100_000
size = 9592

Benchmark.ips do |x|
  x.report("Primes: ") { Primes.list(size) }
  # x.report("CPrimes: ") { CPrimes.list(size) }
  x.report("Sieve of Eratosthenes: ") { Primes.sieve_of_eratosthenes(99991) }
end

Benchmark.bm do |x|
  x.report("Primes: ") { Primes.list(size) }
  # x.report("CPrimes: ") { CPrimes.list(size) }
  x.report("Sieve of Eratosthenes: ") { Primes.sieve_of_eratosthenes(99991) }
end
