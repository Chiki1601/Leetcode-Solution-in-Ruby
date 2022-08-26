def add_strings(num1, num2)
  sum = ''
  carry = 0
  while num1.length.positive? || num2.length.positive?
    last_num1 = num1[0.-1]
    num1 = num1.chomp(last_num1) unless last_num1.nil?

    last_num2 = num2[0.-1]
    num2 = num2.chomp(last_num2) unless last_num2.nil?

    current_sum = last_num1.to_i + last_num2.to_i + carry
    carry = current_sum/10
    sum = (current_sum % 10).to_s + sum
    sum = carry.to_s + sum if num1 == '' && num2 == '' && carry != 0
   end

  sum
end

p add_strings('12', '13')
p add_strings('12', '19')
p add_strings('9', '1')
p add_strings('0', '0')
