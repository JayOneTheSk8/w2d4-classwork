def first_anagram?(string1, string2)
  letters = string1.chars
  perms = letters.permutation(string1.length).to_a #O(n!)
  all_words = perms.map(&:join)
  all_words.include?(string2)
end
