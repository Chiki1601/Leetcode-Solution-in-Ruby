# @param {Integer[]} arr
# @return {Integer}
def num_of_subarrays(arr)
    odd_count = 0
    prefix_sum = 0
    arr.each do |a|
        prefix_sum += a
        odd_count += prefix_sum % 2
    end
    odd_count += (arr.length - odd_count) * odd_count
    return odd_count % 1_000_000_007
end
