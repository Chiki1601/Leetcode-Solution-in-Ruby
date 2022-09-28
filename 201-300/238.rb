# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  left_product = []

  nums.each_with_index do |_, index|
    left_product.push(1) and next if index.zero?

    left_product.push(nums[index - 1] * left_product[index - 1])
  end

  counter = nums.length - 1
  right_product = Array.new(nums.length)
  nums.reverse_each do
    if counter == (right_product.length - 1)
      right_product[counter] = 1
      counter -= 1
      next
    end
    right_product[counter] = right_product[counter + 1] * nums[counter + 1]
    counter -= 1
  end

  output = []

  left_product.each_with_index do |left, index|
    right = right_product[index]
    output.push(left * right)
  end

  output

end

p product_except_self([4,5,1,8,2])
