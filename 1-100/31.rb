# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  i = nums.length - 2

  i -= 1 while i >= 0 && nums[i + 1] <= nums[i]

  if i >= 0
    j = nums.length - 1

    j -= 1 while j >= 0 && nums[j] <= nums[i]
    nums = swap(nums, i, j)
  end
  nums = reverse(nums, i + 1)
end

def reverse(nums, i)
  j = nums.length - 1
  while i < j do
    nums = swap(nums, i, j)
    i += 1
    j -= 1
  end
  nums
end

def swap(nums, i, j)
  temp = nums[i]
  nums[i] = nums[j]
  nums[j] = temp
  nums
end
