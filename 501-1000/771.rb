def num_jewels_in_stones(j, s)
  jewels = {}
  j.split('').each do |jewel|
    jewels.merge! jewel => true
  end

  jewels_count = 0
  s.split('').each do |stone|
    jewels_count += 1 if jewels.key? stone
  end
  jewels_count
end

p num_jewels_in_stones 'aA', 'aAAbbbb'
p num_jewels_in_stones 'z', 'ZZ'
