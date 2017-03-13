require_relative '../../../cryptography/libraries/message'
require_relative '../../../cryptography/libraries/rsa_keys'
require 'test/unit'

class TestMessage < Test::Unit::TestCase
  def test_message
    Cryptography::RSAKeys.generate
    my_public_key = Cryptography::RSAKeys.load_default_public_key
    my_private_key = Cryptography::RSAKeys.load_default_private_key
    message = 'Hello world!'
    wrapped = Cryptography::Message.wrap_message(my_public_key, message)
    assert_not_equal(message, wrapped)
    assert_equal(message, Cryptography::Message.unwrap_message(my_private_key, wrapped))
  end

  def test_sign
    # Cryptography::RSAKeys.generate_in('my_private_key.pem', 'my_public_key.pem')
    # Cryptography::RSAKeys.generate_in('other_private_key.pem', 'other_public_key.pem')
    # message = 'Hello world!'
    # signed = Cryptography::Message.sign_message(
    #   Cryptography::RSAKeys.load_key('my_private_key.pem'),
    #   Cryptography::RSAKeys.load_key('other_public_key.pem'),
    #   message
    # )
    # assert_not_equal(message, signed)
    # decrypted = Cryptography::Message.read_signed_message(
    #   Cryptography::RSAKeys.load_key('other_private_key.pem'),
    #   Cryptography::RSAKeys.load_key('my_public_key.pem'),
    #   signed
    # )
    # assert_equal(message, decrypted)
  end
end
