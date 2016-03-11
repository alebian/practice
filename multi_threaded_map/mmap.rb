class Mmap
  attr_reader :array, :size, :threads, :answer

  MAX_THREADS = 8

  def initialize(array)
    @array = array
    @size = array.size
    @threads = []
    @answer = Array.new(size)
  end

  def map(&block)
    ranges.each { |range_array| threads << create_thread(range_array, answer, &block) }
    threads.each { |thread| thread.join }
    @threads = []
    answer
  end

  private

  def elements_per_thread
    ((size / MAX_THREADS) + 1).to_i
  end

  def ranges
    (0..size - 1).to_a.each_slice(elements_per_thread)
  end

  def create_thread(range_array, answer, &block)
    Thread.new { range_array.each { |index| answer[index] = yield array[index] } }
  end
end
