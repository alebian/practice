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
