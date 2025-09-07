# @param {Integer} n
# @return {Integer[]}
def sum_zero(n)
  # (r = (1...n).to_a) << -r.sum
  (1...n).to_a.tap { _1.push -_1.sum }
end
