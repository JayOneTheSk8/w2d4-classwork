def first_anagram?(string1, string2)
  letters = string1.chars
  perms = letters.permutation(string1.length).to_a #O(n!) (duh)
  all_words = perms.map(&:join)
  all_words.include?(string2)
end

def second_anagram?(string1, string2)
  string2_chars = string2.chars
  string1.each_char do |letter|
    unless string2_chars.find_index(letter) == nil
      is_found = string2_chars.find_index(letter)
      # Because Array#find_index (inthe worst case senario) must iterate through the
      # entire string (n - 1) times (since we're deleting indices), we technically have
      # (n - 1) * n which reduces down to O(n ^ 2)
      string2_chars.delete_at(is_found)
    else
      return false
    end
  end
  true
end

def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
  # Because the fastest sorting algorithms are O(n log n), we can assume that this
  # is two n log n operations
end

def fourth_anagram?(string1, string2) #BONUS
  letter_hash = Hash.new(0)
  (string1 + string2).each_char do |letter| #O(n)
    letter_hash[letter] += 1
  end
  letter_hash.all? { |_, count| count.even? }
end
