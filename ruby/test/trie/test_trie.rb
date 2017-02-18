require_relative '../../trie/trie'
require 'test/unit'

class TestTelephone < Test::Unit::TestCase
  def test_add
    trie = Trie.new
    word = 'alejandro'
    trie.add(word)
    assert(trie.includes?(word))
    assert(!trie.includes?('hello'))
  end

  def test_adding_word_does_not_include_substrings
    trie = Trie.new
    word = 'alejandro'
    trie.add(word)
    assert(!trie.includes?('a'))
    assert(!trie.includes?('al'))
    assert(!trie.includes?('ale'))
    assert(!trie.includes?('alej'))
    assert(!trie.includes?('aleja'))
    assert(!trie.includes?('alejan'))
    assert(!trie.includes?('alejand'))
    assert(!trie.includes?('alejandr'))
    assert(trie.includes?('alejandro'))
  end

  def test_remove
    trie = Trie.new
    word = 'alejandro'
    trie.add(word)
    assert(trie.includes?(word))
    trie.remove(word)
    assert(!trie.includes?(word))
  end

  def test_removing_word_does_not_remove_substrings
    trie = Trie.new
    long_word = 'alejandro'
    substring = long_word[0..3]
    trie.add(long_word)
    trie.add(substring)
    assert(trie.includes?(long_word))
    assert(trie.includes?(substring))
    trie.remove(long_word)
    assert(!trie.includes?(long_word))
    assert(trie.includes?(substring))
  end
end
