require_relative 'replacement_cipher'

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
