#PhaseI

def my_min_all(list)
  list.each do |el1|
    return el1 if list.all? { |el2| el1 <= el2 } #O(n^2)
  end
end

#Phase II

def my_min(list)
  lowest = list.first
  list.each_with_index do |el, idx| #O(n)
    next if idx == 0
    lowest = (el < lowest ? el : lowest)
  end
  lowest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list) == -5

p my_min_all(list) ==  -5

# Phase I

def lcs(list)
  subs = []
  list.each_index do |start_idx| #O(n^2)
    (start_idx...list.length).each do |end_idx|
      subs << list[start_idx..end_idx]
      #Because this happens n^2 times...
    end
  end
  # Another way
  values = subs.map { |sub_arr| sub_arr.reduce(:+) }
  values.max
  # O(n^3)

  # sorted_subs = subs.sort_by { |sub_arr| sub_arr.reduce(:+) } #O(n^3)
  # # sort_by changes things a bit but since n^3 is worse than n log n, n ^ 3 is the time complexity
  # # 'subs' is of size n^2 so
  # # This is n^2 * n (from the reduce method) or n^3
  # sorted_subs.last.reduce(:+)
end

# Phase II

def lcs_on(list)
  return list.max if list.all? { |num| num <= 0 } #O(n)
  current_sum = list.shift
  best_sum = current_sum
  list.each do |next_num| #O(n)
    current_sum += next_num
    if current_sum >= best_sum
      best_sum = current_sum
    elsif current_sum < 0
      current_sum = 0
    end
  end
  best_sum
end

list = [5, 3, -7]
p lcs(list) == 8
list = [2, 3, -6, 7, -6, 7]
p lcs(list) == 8
list = [-5, -1, -3]
p lcs(list) == -1


list = [5, 3, -7]
p lcs_on(list) == 8
list = [2, 3, -6, 7, -6, 7]
p lcs_on(list) == 8
list = [-5, -1, -3]
p lcs_on(list) == -1
