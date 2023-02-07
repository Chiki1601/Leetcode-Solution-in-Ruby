def total_fruit(tree)
  max = 0
  current = {}
  i = 0
  j = 0
  c = 0
  current_tree = nil
  while i < tree.length
    current[tree[i]] = 0 if current[tree[i]].nil?
    current[tree[i]] += 1
    if current.size == 2
      if current_tree == nil
        current_tree = tree[i]
        j += 1
      elsif current_tree == tree[i]
        j += 1
      elsif current_tree != tree[i]
        j = 1
        current_tree = tree[i]
      end
    end
    if current.size <= 2
      c += 1
      max = [c, max].max
    end
    if current.size > 2
      i -= j
      j = 0
      c = 0
      current = {}
      current_tree = nil
    else
      i += 1
    end
  end
  max
end
