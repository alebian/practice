class SingleLinkedList
  attr_reader :size, :first_node

  def initialize
    @first_node = nil
    @last_node = nil
    @size = 0
  end

  def first
    return nil if @first_node.nil?
    @first_node.value
  end

  def last
    return nil if @last_node.nil?
    @last_node.value
  end

  def append(element)
    if @last_node.nil?
      @first_node = Node.new(element)
      @last_node = @first_node
    else
      node = Node.new(element)
      @last_node.head = node
      @last_node = node
    end
    @size += 1
    element
  end

  def prepend(element)
    @first_node = Node.new(element, @first_node)
    element
  end

  def push(element)
    append(element)
  end

  def delete(element)
    current = @first_node
    while !current.nil?
      return remove_node(current) if current.value == element
      current = current.head
    end
    false
  end

  def delete_last
    remove_node(@last_node)
  end

  def pop
    delete_last
  end

  def concat(list)
    new_list = clone
    current = list.first_node
    while !current.nil?
      new_list.append(current.value)
      current = current.head
    end
    new_list
  end

  def concat!(list)
    current = list.first_node
    while !current.nil?
      append(current.value)
      current = current.head
    end
    self
  end

  def clone
    list = SingleLinkedList.new
    current = @first_node
    while !current.nil?
      list.append(current.value)
      current = current.head
    end
    list
  end

  def include?(element)
    current = @first_node
    while !current.nil?
      return true if current.value == element
      current = current.head
    end
    false
  end

  def at(index)
    return nil if (size <= 0 || size <= index - 1)
    current = @first_node
    while index >= 0
      current = current.head
      index -= 1
    end
    current.value
  end

  def length
    size
  end

  def map(block)
    clone.map!(block)
  end

  def map!(block)

  end

  def index(element)
    return nil if size == 0
    index = 0
    current = @first
    while !current.nil?
      return index if current.value == element
      current = current.head
      index += 1
    end
    nil
  end

  def shift(amount)
    return if amount <= 0 || size == 0
    amount.each { shift_one }
  end

  def rotate(amount)
    return if amount <= 0 || size == 0
    amount.each { rotate_one }
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
    list = SingleLinkedList.new
    current = @first_node
    while !current.nil?
      list.prepend(current.value)
      current = current.head
    end
    list
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
    return '[]' if size == 0
    string = '['
    current = @first_node
    while !current.nil?
      string += current.value.to_s
      string += ', ' unless current.head.nil?
      current = current.head
    end
    string += ']'
  end

  def uniq
    list = SingleLinkedList.new
    current = @first_node
    while !current.nil?
      list.append(current.value) unless list.include?(current.value)
      current = current.head
    end
    list
  end

  def uniq!

  end

  private

  def remove_node(node)
    return false if size == 0
    if @first == node
      if size > 1
        @first = @first.head
      else
        @first = nil
        @last = nil
      end
      size -= 1
      return true
    else
      current = @first_node
      while !current.nil?
        if current.head == node
          current.head = node.head
          return true
        end
        current = current.head
      end
    end
    false
  end

  def shift_one
    @last_node.head = @first_node
    @first_node = @first_node.head
    @last_node = @last_node.head
    @last_node.head = nil
  end

  def rotate_one
    @last_node.head = @first_node
    @first_node = @first_node.head
    @last_node = @last_node.head
    @last_node.head = nil
  end

  class Node
    attr_accessor :value, :head

    def initialize(value, head = nil)
      @value = value
      @head = head
    end
  end
end
