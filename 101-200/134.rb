# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
  return -1 if gas.sum < cost.sum
  idx = 0
  diff = 0
  gas.size.times do |i|
    diff += (gas[i] - cost[i])
    if diff.negative?
      idx = i + 1
      diff = 0
    end
  end
  idx
end
