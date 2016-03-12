require_relative '../../telephone/telephone'
require 'test/unit'

class TestTelephone < Test::Unit::TestCase
  def test_translate_word
    word = 'alejandro'
    expected = '253526376'
    assert_equal(expected, Telephone.to_number(word))
  end
end
