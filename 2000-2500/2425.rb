def xor_all_nums(nums1, nums2)
  c1 = nums1.length
  c2 = nums2.length
  x1, x2 = 0, 0

  if c1.odd?
    nums2.each { |num| x2 ^= num }
  end
  if c2.odd?
    nums1.each { |num| x1 ^= num }
  end
  x1 ^ x2
end
