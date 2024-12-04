# frozen_string_literal: true

def sub_strings(word, dictionary)
  hash = {}
  lower_words = word.downcase.split(' ')
  lower_words.each do |lower_word|
    dictionary.each do |find|
      lower_find = find.downcase
      count = lower_word.scan(lower_find).length
      hash[lower_find] = (hash[lower_find] || 0) + count if count.positive?
    end
  end
  hash
end
p dictionary = %w[below down go going horn how howdy it i low own part partner
                  sit]
p sub_strings('below', dictionary)
