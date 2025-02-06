# @param {Integer[]} nums
# @return {Integer}
def tuple_same_product(nums)
    product_count = Hash.new(0)  # Initialize a hash with default value 0
    result = 0

    # Iterate over all pairs (i, j)
    (0...nums.length).each do |i|
        ((i + 1)...nums.length).each do |j|
            product = nums[i] * nums[j]
            result += 8 * product_count[product]  # Add 8 times the count of previous occurrences of the product
            product_count[product] += 1  # Increment the count for this product
        end
    end

    result
end
