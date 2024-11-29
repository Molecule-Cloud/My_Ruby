def caesar_cipher(text, num_of_shifts)
  result = ""
  text.each_char do |character|
      if character.match?(/[A-Za-z]/)
          shift = num_of_shifts % 26
          if character.upcase == character
              upper_char = ((character.ord - 65 + shift) % 26 + 65).chr
              result += upper_char
          elsif character.downcase == character
              lower_char = ((character.ord - 97 + shift) % 26 + 97).chr
              result += lower_char
          end
      else
          result += character
      end
  end
  return result
end
caesar_cipher("animals", 1)
