# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  data = []
  data[0] = 1
  data[1] = 1
  (2..n).to_a.each do |index|
    data[index] = data[index - 1] + data[index - 2]
  end
  data[n]
end

p climb_stairs 2
p climb_stairs 3
