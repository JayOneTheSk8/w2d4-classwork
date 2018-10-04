#Phase 1

def bad_two_sum?(arr, target_sum)
  arr.each_index do |start_idx|
    (start_idx+1...arr.length).each do |end_idx| #O(n^2)
      return true if arr[start_idx] + arr[end_idx] == target_sum
    end
  end
  false
end


def okay_two_sum?(arr, target_sum)
  num_check = arr.select { |num| num < target_sum }
  sorted_nums = num_check.sort.reverse #O(n log n)
  # Because n log n is the best case senario for sorting algorithms, '.sort' takes
  # n log n time to operate, the 'select' and 'each' enumerables both take O(n)
  # time which is better
  comparitor = sorted_nums.shift
  sorted_nums.each do |num|
    return true if comparitor + num == target_sum
  end
  false
end
