require 'prime'
# @param {Integer} left
# @param {Integer} right
# @return {Integer[]}
def closest_primes(left, right)
  Prime.each(right).each_cons(2).select { |a, b| a >= left && b <= right }.min_by { |a, b| b - a } || [-1, -1]
end
