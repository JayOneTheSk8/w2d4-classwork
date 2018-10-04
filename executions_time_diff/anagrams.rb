def first_anagram?(string1, string2)
  letters = string1.chars
  perms = letters.permutation(string1.length).to_a #O(n!)
  all_words = perms.map(&:join)
  all_words.include?(string2)
end

def second_anagram?(string1, string2)
  string2_chars = string2.chars
  string1.each_char do |letter|
    unless string2_chars.find_index(letter) == nil
      is_found = string2_chars.find_index(letter)
      string2_chars.delete_at(is_found)
    else
      return false
    end
  end
  true
end
