module Immutable
  module StrongTyped

    def self.try_clone(value)
      value.clone
    rescue
      value
    end

    class SingleLinkedList
      attr_reader :size, :type

      def initialize(elements = [])
        @size = elements.size
        if size == 0
          @type = nil
          @head = nil
          @tail = nil
        else
          @type = elements[0].class
          raise ArgumentError, 'Unsafe type list.' unless valid_elements?(elements)
          add_elements(elements)
        end
      end

      def first
        return StrongTyped.try_clone(@head.value) if size > 0
        nil
      end

      def last
        return StrongTyped.try_clone(@tail.value) if size > 0
        nil
      end

      def add(element)
        type_check(element)
        SingleLinkedList.new(to_a << element)
      end

      def to_a
        inject([]) { |node| StrongTyped.try_clone(node.value) }
      end

      def inject(object, &block)
        each do |node|
          object = block.call(object, StrongTyped.try_clone(node.value))
        end
        object
      end

      def each
        current = @head
        while current != nil
          yield StrongTyped.try_clone(current.value)
          current = @head.next_node
        end
      end

      private

      def valid_elements?(elements)
        elements.all? { |element| element.is_a? @type }
      end

      def add_elements(elements)
        current = Node.new(elements[0])
        @head = @tail = current
        i = 1
        while i < elements.size
          node = Node.new(elements[i])
          @tail = current.next_node = current = node
          i += 1
        end
        self
      end

      class Node
        attr_reader :value, :next_node

        def initialize(value, next_node = nil)
          @value = StrongTyped.try_clone(value)
          @next_node = next_node
        end

        def next_node=(node)
          @next_node = node
        end
      end
    end
  end
end
