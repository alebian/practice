class ReverseNumberList
  attr_accessor :next, :value

  def initialize(value = nil)
    @value = value
    @next = nil
  end

  def to_s
    result = ''
    current = self

    while current
      result << "#{current.value} -> "
    end

    result
  end
end


def add_two_numbers(num1, num2)
  finished = false
  result_head = ReverseNumberList.new(num1&.value)

  num1_current = num1
  num2_current = num2

  while !finished

  end

  result_head
end

l1 = ReverseNumberList.new(2)
l1.next = ReverseNumberList.new(4)
l1.next.next = ReverseNumberList.new(3)

l2 = ReverseNumberList.new(5)
l2.next = ReverseNumberList.new(6)
l2.next.next = ReverseNumberList.new(4)

result = add_two_numbers(l1, l2)
puts result
