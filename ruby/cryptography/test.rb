require_relative 'replacement_cipher'
require_relative 'vigenere_cipher'

ALPHABET = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'Ñ', 'O', 'P', 'Q', 'R', 'S',
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

# encrypted_message = 'KOZFVPCYVCWVZHMZLCIOHIFIZGJCZTVVXIGJLZHYZLGVMNVLYZ'
#
# (1..ALPHABET.size).each do |i|
#   encryption_dictionary, decryption_dictionary = ReplacementCypher.rotate(ALPHABET, i)
#   cypher = ReplacementCypher.new(encryption_dictionary.merge(' ' => ' '), decryption_dictionary.merge(' ' => ' '))
#   puts "K #{i}: #{cypher.decrypt(encrypted_message)}"
# end

# encryption_dictionary, decryption_dictionary = ReplacementCypher.rotate(ALPHABET, 22)
# cypher = ReplacementCypher.new(encryption_dictionary.merge(' ' => ' '), decryption_dictionary.merge(' ' => ' '))

# puts encrypted_message
# puts cypher.decrypt(encrypted_message)
# message = "ESTE ES UN MENSAJE SUPER SECRETO"
#
# puts message
#
# encrypted_message = cypher.encrypt(message)
#
# puts encrypted_message
#
# puts decrypted_message = cypher.decrypt(encrypted_message)
#
# puts decrypted_message

# encrypted_message = 'D>]T0C34D344]>}>{:HP{4C3>34]02014:034(P4CT>P)0]{)4034014}034D344]0C1>]'

# message = 'ESTO ES UNA PRUEBA'
# key = 'ECFD'
# cypher = VigenereCipher.new(key, ALPHABET)
# puts cypher.encrypt(message)
#
# encrypted_message = 'IUYRDGXCYOFCTTZHFC'
# puts cypher.decrypt(encrypted_message)

def count_letters(array_letters)
  array_letters.each_with_object({}) do |letter, count|
    count[letter] = count.fetch(letter, 0) + 1
  end
end

encrypted_message = 'JGAZNWINHYLZDYVBBJLCQHTNKUDQXMOXJNOZMUSPNONYJMTEJHQHQFOOPUPBCYAÑJONCNNQHNMONDHKUTJMQCMOPNFAOXNTNLOAZMJDQYMOZCJRNBAOQTUIENFAIXTLXJGAZMJAXJVAZMUDNMYLNLJMUMUYHVUMHTÑIGDXDQUCLSJPIBCUSFNUGXXGEEXKAEJMESJÑENASLHLBAEYJROJXACQTCNMYPUCUNMJWOYNHZNKUOGAJDUJXENRYTENJSCNMONTYJNMJYFXFIGJMIBUUSNTFAPNFAFKUROJNYCTUYNBYSGJVACAUCGQWAZMJJHJHSNTPAPXMGNECOGJUTENCNGJGEGAJSPNULGDMAÑJDOFDNPUNNPNTGENMJSNTTOFDKIOXSSQNNFBATOCXMMNVÑEZNMEZBOSNTUSQBUDBTJRBBUYPQZIOQFTBANIBVMEDDYRUMUPNAULBOMAEDHVHNFOCJOSNMJ'
key = 'JUAN'
key_length = key.size

letter_groups = Array.new(key_length)
encrypted_message.split('').each_slice(key_length).each do |group|
  group.each_with_index do |letter, index|
    letter_groups[index] = [] if letter_groups[index].nil?
    letter_groups[index] << letter
  end
end

letter_groups.map! { |lg| count_letters(lg) }

# puts letter_groups

cypher = VigenereCipher.new(key, ALPHABET)
puts cypher.decrypt(encrypted_message)
