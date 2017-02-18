require 'ruby-prof'
require_relative 'mmap'

array = Array.new(100_000) { (rand * 100).to_i }

result = RubyProf.profile do
  Mmap.new(array).map { |x| x / 2 }
end

printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, {})
