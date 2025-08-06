# @param {Integer[]} fruits
# @param {Integer[]} baskets
# @return {Integer}
def num_of_unplaced_fruits(fruits, baskets)
  n = baskets.length
  n_tree = 1
  n_tree <<= 1 while n_tree <= n

  seg_tree = Array.new(n_tree * 2, 0)

  # Fill leaf nodes with basket values
  (0...n).each do |i|
    seg_tree[n_tree + i] = baskets[i]
  end

  # Build the segment tree from leaves up
  (n_tree - 1).downto(1) do |i|
    seg_tree[i] = [seg_tree[2 * i], seg_tree[2 * i + 1]].max
  end

  count = 0

  fruits.each do |fruit|
    index = 1

    # If no basket can hold the fruit
    if seg_tree[index] < fruit
      count += 1
      next
    end

    # Traverse to the correct basket index
    while index < n_tree
      if seg_tree[2 * index] >= fruit
        index = 2 * index
      else
        index = 2 * index + 1
      end
    end

    # Mark basket as used
    seg_tree[index] = -1

    # Update ancestors
    while index > 1
      index >>= 1
      seg_tree[index] = [seg_tree[2 * index], seg_tree[2 * index + 1]].max
    end
  end

  count
end
