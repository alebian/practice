require 'benchmark/ips'
require 'benchmark'
require_relative '../../primes/primes'
require_relative '../../primes/c_primes'

size = 10_000_000

Benchmark.ips do |x|
  x.report("Primes: ") { Primes.primes_list(size) }
  x.report("CPrimes: ") { CPrimes.primes_list(size) }
end

Benchmark.bm do |x|
  x.report("Primes: ") { Primes.primes_list(size) }
  x.report("CPrimes: ") { CPrimes.primes_list(size) }
end
