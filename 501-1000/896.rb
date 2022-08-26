# @param {Integer[]} nums
# @return {Boolean}
def is_monotonic(a)

  return true if [0, 1].include? a.length

  increasing = nil

  a.length.times do |index|
    next if index.zero?

    increasing = a[index - 1] < a[index] if increasing.nil? && a[index - 1] != a[index]

    next if increasing.nil? && a[index - 1] == a[index]

    if increasing
      return false if a[index] < a[index - 1]
    else
      return false if a[index] > a[index - 1]
    end
  end

  true
end

p is_monotonic [1, 2, 2, 3]
p is_monotonic [6, 5, 4, 4]
p is_monotonic [1, 3, 2]
p is_monotonic [1, 2, 4, 5]
