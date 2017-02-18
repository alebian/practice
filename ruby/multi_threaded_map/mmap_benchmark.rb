require 'benchmark/ips'
require 'benchmark'
require_relative 'mmap'

size = 10_000_000
array = Array.new(size) { (rand * 100).to_i }

Benchmark.ips do |x|
  x.report("map: ") { array.map { |x| x / 2 } }
  x.report("for each: ") do
    answer = Array.new(size)
    array.each_with_index do |element, index|
      answer[index] = array[index] / 2
    end
    answer
  end
  x.report("mmap: ") { Mmap.new(array).map { |x| x / 2 } }
end

Benchmark.bm do |x|
  x.report("map: ") { array.map { |x| x / 2 } }
  x.report("for each: ") do
    answer = Array.new(size)
    array.each_with_index do |element, index|
      answer[index] = array[index] / 2
    end
    answer
  end
  x.report("mmap: ") { Mmap.new(array).map { |x| x / 2 } }
end
