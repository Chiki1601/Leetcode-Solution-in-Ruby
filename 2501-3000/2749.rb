def make_the_integer_zero(num1, num2)
  (0..60).each do |t|
    s = num1 - t * num2
    next if s < 0
    next if s < t
    ones = s.to_s(2).count('1')
    return t if ones <= t
  end
  -1
end
