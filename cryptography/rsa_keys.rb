require 'openssl'

module Cryptography
  class RSAKeys
    DEFAULT_KEY_SIZE = 2048
    DEFAULT_CIPHER = 'AES-128-CBC'.freeze
    DEFAULT_PRIVATE_KEY_PATH = 'private_key.pem'.freeze
    DEFAULT_PUBLIC_KEY_PATH = 'public_key.pem'.freeze

    class << self
      def generate
        generate_in(DEFAULT_PRIVATE_KEY_PATH, DEFAULT_PUBLIC_KEY_PATH)
      end

      def generate_in(private_path, public_path)
        key = OpenSSL::PKey::RSA.new(DEFAULT_KEY_SIZE)
        save_pems(key, private_path, public_path)
      end

      def generate_with_pass_phrase(pass_phrase)
        generate_with_pass_phrase_in(pass_phrase, DEFAULT_PRIVATE_KEY_PATH,
                                     DEFAULT_PUBLIC_KEY_PATH)
      end

      def generate_with_pass_phrase_in(pass_phrase, private_path, public_path)
        key = OpenSSL::PKey::RSA.new(DEFAULT_KEY_SIZE)
        cipher = OpenSSL::Cipher.new(DEFAULT_CIPHER)
        key_secure = key.export(cipher, pass_phrase)
        save_pems(key_secure, private_path, public_path)
      end

      def load_default_private_key
        load_key(DEFAULT_PRIVATE_KEY_PATH)
      end

      def load_default_public_key
        load_key(DEFAULT_PUBLIC_KEY_PATH)
      end

      def load_key(path)
        key_pem = load_pem(path)
        OpenSSL::PKey::RSA.new(key_pem)
      end

      def load_key_with_pass_phrase(path, pass_phrase)
        key_pem = load_pem(path)
        OpenSSL::PKey::RSA.new(key_pem, pass_phrase)
      end

      private

      def save_pems(key, private_path, public_path)
        open(private_path, 'w') { |io| io.write key.to_pem }
        open(public_path, 'w') { |io| io.write key.public_key.to_pem }
      end

      def load_pem(pem_path)
        File.read(pem_path)
      end
    end
  end
end
