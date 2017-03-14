require_relative 'replacement_cipher'
require 'pry'

class VigenereCipher
  def initialize(key, alphabet)
    @key = []
    key.split('').each do |letter|
      enc, dec = ReplacementCypher.rotate(alphabet, alphabet.index(letter))
      @key << { letter: letter, encryption_dictionary: enc, decryption_dictionary: dec }
    end
    puts @key
  end

  def encrypt(message)
    answer = ''
    message.split('').each_slice(@key.size).each do |groups|
      groups.each_with_index do |letter, index|
        answer << @key[index][:encryption_dictionary][letter]
      end
    end
    answer
  end

  def decrypt(encrypted_message)
    answer = ''
    encrypted_message.split('').each_slice(@key.size).each do |groups|
      groups.each_with_index do |letter, index|
        answer << @key[index][:decryption_dictionary][letter]
      end
    end
    answer
  end
end
