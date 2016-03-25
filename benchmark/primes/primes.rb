require 'benchmark/ips'
require 'benchmark'
require_relative '../../primes/primes'
require_relative '../../primes/c_primes'

size = 100_000

Benchmark.ips do |x|
  x.report("Primes: ") { Primes.list(size) }
  x.report("CPrimes: ") { CPrimes.list(size) }
end

Benchmark.bm do |x|
  x.report("Primes: ") { Primes.list(size) }
  x.report("CPrimes: ") { CPrimes.list(size) }
end
