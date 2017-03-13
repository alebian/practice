require_relative '../../cryptography/replacement_cipher'
require 'test/unit'

class TestReplacementCipher < Test::Unit::TestCase
  ALPHABET = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
    'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ]

  def setup
    @message = 'SUPER SECRET MESSAGE'
    @encrypted_message = 'TVQFS TFDSFU NFTTBHF'
    @encryption_dictionary = {'A' => 'B', 'B' => 'C', 'C' => 'D', 'D' => 'E', 'E' => 'F', 'F' => 'G', 'G' => 'H', 'H' => 'I', 'I' => 'J', 'J' => 'K', 'K' => 'L', 'L' => 'M', 'M' => 'N', 'N' => 'O', 'O' => 'P', 'P' => 'Q', 'Q' => 'R', 'R' => 'S', 'S' => 'T', 'T' => 'U', 'U' => 'V', 'V' => 'W', 'W' => 'X', 'X' => 'Y', 'Y' => 'Z', 'Z' => 'A'}
    @decryption_dictionary = {'B' => 'A', 'C' => 'B', 'D' => 'C', 'E' => 'D', 'F' => 'E', 'G' => 'F', 'H' => 'G', 'I' => 'H', 'J' => 'I', 'K' => 'J', 'L' => 'K', 'M' => 'L', 'N' => 'M', 'O' => 'N', 'P' => 'O', 'Q' => 'P', 'R' => 'Q', 'S' => 'R', 'T' => 'S', 'U' => 'T', 'V' => 'U', 'W' => 'V', 'X' => 'W', 'Y' => 'X', 'Z' => 'Y', 'A' => 'Z'}
    @cypher = ReplacementCypher.new(
      @encryption_dictionary.merge(' ' => ' '),
      @decryption_dictionary.merge(' ' => ' ')
    )
  end

  def test_encrypt
    assert_equal(@encrypted_message, @cypher.encrypt(@message))
  end

  def test_decrypt
    assert_equal(@message, @cypher.decrypt(@encrypted_message))
  end

  def test_rotate
    assert_equal([@encryption_dictionary, @decryption_dictionary], ReplacementCypher.rotate(ALPHABET, 1))
  end

  def test_traverse_dictionary
    cypher = ReplacementCypher.new(
      @encryption_dictionary.merge(' ' => ' '),
      ReplacementCypher.traverse_dictionary(@encryption_dictionary).merge(' ' => ' ')
    )
    enc = cypher.encrypt(@message)
    assert_not_equal(enc, @message)
    assert_equal(@message, cypher.decrypt(enc))
  end
end
