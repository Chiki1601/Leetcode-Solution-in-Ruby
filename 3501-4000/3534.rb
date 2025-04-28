# @param {Integer} n
# @param {Integer[]} nums
# @param {Integer} max_diff
# @param {Integer[][]} queries
# @return {Integer[]}
def path_existence_queries(n, nums, max_diff, queries)
  sorted_indices = (0...n).to_a.sort_by { |i| nums[i] }
  position = Array.new(n, 0)
  values = Array.new(n, 0)

  sorted_indices.each_with_index do |i, idx|
    position[i] = idx
    values[idx] = nums[i]
  end

  reachable_index = Array.new(n, 0)
  j = 0
  (0...n).each do |i|
    j = [j, i].max
    while j + 1 < n && values[j + 1] - values[i] <= max_diff
      j += 1
    end
    reachable_index[i] = j
  end

  max_log = 1
  max_log += 1 while (1 << max_log) < n

  up_table = Array.new(max_log) { Array.new(n, 0) }
  up_table[0] = reachable_index.dup

  (1...max_log).each do |k|
    (0...n).each do |i|
      up_table[k][i] = up_table[k - 1][up_table[k - 1][i]]
    end
  end

  results = []
  queries.each do |start, finish|
    if start == finish
      results << 0
      next
    end

    start_pos = position[start]
    end_pos = position[finish]
    start_pos, end_pos = end_pos, start_pos if start_pos > end_pos

    if (nums[start] - nums[finish]).abs <= max_diff
      results << 1
      next
    end

    if reachable_index[start_pos] < end_pos
      current = start_pos
      jump_count = 0
      (max_log - 1).downto(0) do |k|
        if up_table[k][current] < end_pos
          current = up_table[k][current]
          jump_count += 1 << k
        end
      end
      results << (reachable_index[current] >= end_pos ? jump_count + 1 : -1)
    else
      results << 1
    end
  end

  results
end
