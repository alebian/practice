require_relative '../../telephone/telephone'
require 'test/unit'

class TestTelephone < Test::Unit::TestCase
  def test_translate_word
    telephone = Telephone.new
    word = 'alejandro'
    expected = '253526376'
    assert_equal(expected, telephone.translate_word(word))
  end
end
