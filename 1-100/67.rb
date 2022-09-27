
# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  output = ''
  carry = 0
  i = a.length - 1
  j = b.length - 1
  while i >= 0 || j >= 0
    sum = 0
    l_a = a[i - a.length] # "0" "1" nil
    l_b = b[j - b.length] # "0" "1" nil

    sum = sum + l_a.to_i + l_b.to_i + carry

    output = (sum % 2).to_s + output
    carry = sum / 2
    i -= 1
    j -= 1
  end
  output = carry.to_s + output  unless carry.zero?
  output
end

a = '11'
b = '1'
p add_binary(a, b)

a = '1010'
b = '1011'

p add_binary(a, b)
