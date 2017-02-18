class Trie
  def initialize
    @root = Node.new
  end

  def includes?(word)
    final_node(word).finish
  end

  def add(word)
    final_node(word).finish = true
  end

  def remove(word)
    final_node(word).finish = false
  end

  private

  def final_node(word)
    idx = 0
    current = @root
    while idx < word.size
      current = current.get(word[idx])
      idx += 1
    end
    current
  end

  def sanitize(word)
    word.downcase.split(' ')[0].gsub(/[^a-z0-9]/, '')
  end

  class Node
    attr_accessor :finish

    def initialize(finish = false)
      @finish = finish
      @letters = {}
    end

    def get(character)
      @letters[character] = Node.new unless @letters.key?(character)
      @letters[character]
    end
  end
end
