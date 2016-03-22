class CircularList
  attr_reader :size

  def initialize
    set_default_attributes
  end

  def next
    return nil if @current.nil?
    answer = @current.value
    @current = @current.head
    answer
  end

  def previous
    return nil if @current.nil?
    @current = @current.tail
    @current.value
  end

  def add(element)
    @first.nil? ? add_first_node(element) : add_end_node(element)
    @size += 1
    true
  end

  def append(element)
    add(element)
  end

  def remove(element = nil)
    return false if size == 0
    element.nil? ? remove_node(@current.tail) : find_and_remove(element)
  end

  private

  def set_default_attributes
    @size = 0
    @current = nil
    @first = nil
    @last = nil
  end

  def find_node(element)
    current = @first
    while current != @last
      return current if current.value == element
      current = current.head
    end
    nil
  end

  def add_first_node(element)
    @first = Node.new(element)
    @first.head = @first
    @first.tail = @first
    @last = @first
    @current = @first
  end

  def add_end_node(element)
    aux = Node.new(element)
    aux.tail = @last
    aux.head = @first
    @last.head = aux
    @first.tail = aux
    @last = aux
  end

  def remove_node(node)
    return false if node.nil?
    if size <= 1
      set_default_attributes
    else
      node.tail.head = node.head
      node.head.tail = node.tail
      @size -= 1
    end
    true
  end

  def find_and_remove(element)
    remove_node(find_node(element))
  end

  class Node
    attr_accessor :value, :head, :tail

    def initialize(value, head = nil, tail = nil)
      @value = value
      @head = head
      @tail = tail
    end
  end
end
