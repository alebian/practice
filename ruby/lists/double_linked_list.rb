class DoubleLinkedList
  attr_reader :first, :last, :size

  def initialize
    @first = nil
    @last = nil
    @size = 0
  end

  def append(element)

  end

  def prepend(element)

  end

  def push(element)
    append(element)
  end

  def delete(element)

  end

  def delete_last

  end

  def pop
    delete_last
  end

  def concat(list)

  end

  def include?(element)

  end

  def at(index)

  end

  def length
    size
  end

  def map(block)

  end

  def index(element)

  end

  def shift(amount)

  end

  def rotate(amount)

  end

  def slice()

  end

  def slice!()

  end

  def reject

  end

  def reject!

  end

  def reverse

  end

  def reverse!

  end

  def sort

  end

  def sort!

  end

  def to_a

  end

  def to_s

  end

  def uniq

  end

  def uniq!

  end

  private

  class Node
    attr_accessor :value, :head, :tail

    def initialize(value, head = nil, tail = nil)
      @value = value
      @head = head
      @tail = tail
    end
  end
end
