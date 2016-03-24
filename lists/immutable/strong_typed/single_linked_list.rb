module Immutable
  module StrongTyped

    def self.try_clone(value)
      value.clone
    rescue
      value
    end

    class SingleLinkedList
      attr_reader :size

      def initialize(elements = [])
        @size = elements.size
        if size == 0
          @type = nil
          @head = nil
          @tail = nil
        else
          @type = elements[0].class.to_s.freeze
          raise ArgumentError, 'Unsafe type list.' unless valid_elements?(elements)
          add_elements(elements)
        end
      end

      def type
        return nil if @type.nil?
        @type.clone
      end

      def first
        return StrongTyped.try_clone(@head.value) if size > 0
        nil
      end

      def last
        return StrongTyped.try_clone(@tail.value) if size > 0
        nil
      end

      def [](index)
        return nil if index >= size
        aux = 0
        current = @head
        while aux < index
          current = current.next_node
          aux += 1
        end
        StrongTyped.try_clone(current.value)
      end

      def add(element)
        type_check(element)
        SingleLinkedList.new(to_a << element)
      end

      def to_a
        inject([]) { |array, element| array << element }
      end

      def inject(object, &block)
        each do |element|
          block.call(object, element)
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
        elements.all? { |element| element.class.to_s == @type }
      end

      def type_check(element)
        return if @type.nil?
        raise ArgumentError unless element.class.to_s == @type
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
