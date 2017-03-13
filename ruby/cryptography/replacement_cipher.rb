class ReplacementCypher
  def initialize(encryption_dictionary, decryption_dictionary, missing_char = '_')
    @encryption_dictionary = encryption_dictionary
    @decryption_dictionary = decryption_dictionary
    @missing_char = missing_char
  end

  def self.traverse_dictionary(dictionary)
    dictionary.each_with_object({}) do |(key, value), dictionary|
      dictionary[value] = key unless value.nil? && value.empty?
      dictionary
    end
  end

  def self.rotate(alphabet, n)
    encryption_dictionary = {}
    decryption_dictionary = {}
    alphabet.each_with_index do |char, index|
      new_index = (index + n + 1) % alphabet.size - 1
      new_char = alphabet[new_index]
      encryption_dictionary[char] = new_char
      decryption_dictionary[new_char] = char
    end
    [encryption_dictionary, decryption_dictionary]
  end

  def encrypt(message)
    message.split('').each_with_object('') do |char, answer|
      new_char = @encryption_dictionary[char].nil? ? @missing_char : @encryption_dictionary[char]
      answer << new_char
    end
  end

  def decrypt(cypher)
    cypher.split('').each_with_object('') do |char, answer|
      new_char = @decryption_dictionary[char].nil? ? @missing_char : @decryption_dictionary[char]
      answer << new_char
    end
  end
end

ALPHABET = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
  'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
]

EMPTY_DICTIONARY = {
  'A' => nil,
  'B' => nil,
  'C' => nil,
  'D' => nil,
  'E' => nil,
  'F' => nil,
  'G' => nil,
  'H' => nil,
  'I' => nil,
  'J' => nil,
  'K' => nil,
  'L' => nil,
  'M' => nil,
  'N' => nil,
  'O' => nil,
  'P' => nil,
  'Q' => nil,
  'R' => nil,
  'S' => nil,
  'T' => nil,
  'U' => nil,
  'V' => nil,
  'W' => nil,
  'X' => nil,
  'Y' => nil,
  'Z' => nil,
  ' ' => ' '
}

encryption_dictionary, decryption_dictionary = ReplacementCypher.rotate(ALPHABET, 1)
cypher = ReplacementCypher.new(encryption_dictionary.merge(' ' => ' '), decryption_dictionary.merge(' ' => ' '))

message = "ESTE ES UN MENSAJE SUPER SECRETO"

puts message

encrypted_message = cypher.encrypt(message)

puts encrypted_message

decrypted_message = cypher.decrypt(encrypted_message)

puts decrypted_message

puts message.upcase == decrypted_message
