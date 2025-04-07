def can_partition(nums)
  @nums = nums
  sum = @nums.sum / 2.0
  return false unless (sum % 1).zero?

  partials = Set[0]

  nums.each do |num|
    new_partials = Set[]

    partials.each do |partial|
      new_partial = partial + num
      return true if new_partial == sum
      next if new_partial > sum

      new_partials.add(new_partial)
    end

    partials.merge(
      new_partials
    )
  end

  false
end
