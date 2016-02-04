class Telephone
  attr_reader :touch_pad, :number_letters

  def initialize
    @touch_pad = {
      A: 2, B: 2, C: 2, D: 3, E: 3, F: 3, G: 4, H: 4, I: 4, J: 5, K: 5, L: 5, M: 6, N: 6, O: 6,
      P: 7, Q: 7, R: 7, S: 7, T: 8, U: 8, V: 8, W: 9, X: 9, Y: 9, Z: 9
    }
    @number_letters = {
      2 => 'ABC', 3 => 'DEF', 4 => 'GHI', 5 => 'JKL', 6 => 'MNO', 7 => 'PQRS', 8 => 'TUV',
      9 => 'WXYZ'
    }
  end

  def translate_word(word)
    letters = word.upcase.split('')
    answer = ''
    letters.each do |letter|
      sym = letter.to_sym
      answer += touch_pad[sym].to_s if touch_pad.key?(sym)
      answer += '' unless touch_pad.key?(sym)
    end
    answer
  end

  def letters(number)
    number_letters[number.to_i]
  end
end
