require_relative 'rsa_keys'

module Cryptography
  class Message
    class << self
      def wrap_message(public_key, message)
        public_key.public_encrypt(message)
      end

      def unwrap_message(private_key, message)
        private_key.private_decrypt(message)
      end

      def sign_message(my_private_key, other_public_key, message)
        encrypted = my_private_key.private_encrypt(message)
        other_public_key.public_encrypt(encrypted)
      end

      def read_signed_message(my_private_key, other_public_key, message)
        decrypted = my_private_key.private_decrypt(message)
        other_public_key.public_decrypt(decrypted)
      end
    end
  end
end
