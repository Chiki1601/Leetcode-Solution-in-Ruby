def count_symmetric_integers(low, high)
    (low..high).count { |num| symmetric?(num.to_s) }
end


def symmetric?(num)
    return false unless num.length % 2 == 0
    half = num.length / 2
    left = num[0...half]
    right = num[half..-1]
    left.chars.map { |digit| digit.to_i }.sum == right.chars.map { |digit| digit.to_i }.sum
end
