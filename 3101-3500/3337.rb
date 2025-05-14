# @param {String} s
# @param {Integer} t
# @param {Integer[]} nums
# @return {Integer}
def length_after_transformations(s, t, nums)
  mod = 10**9 + 7
  k   = 26
  freq = Array.new(k, 0)
  s.each_byte { |b| freq[b - 97] += 1 }
  m = Array.new(k) { Array.new(k, 0) }
  (0...k).each do |i|
    (1..nums[i]).each do |d|
      m[i][(i + d) % k] += 1
    end
  end
  mul = lambda do |a_mat, b_mat|
    c = Array.new(k) { Array.new(k, 0) }
    (0...k).each do |i|
      (0...k).each do |r|
        a_val = a_mat[i][r]
        next if a_val.zero?
        (0...k).each do |j|
          c[i][j] = (c[i][j] + a_val * b_mat[r][j]) % mod
        end
      end
    end
    c
  end
  pow_fn = lambda do |mat, exp|
    res  = Array.new(k) { |i| Array.new(k) { |j| i == j ? 1 : 0 } }
    base = mat
    while exp > 0
      res  = mul.call(res, base) if (exp & 1) == 1
      base = mul.call(base, base)
      exp >>= 1
    end
    res
  end
  mt = pow_fn.call(m, t)
  ans = 0
  (0...k).each do |i|
    next if freq[i].zero?
    (0...k).each do |j|
      ans = (ans + freq[i] * mt[i][j]) % mod
    end
  end
  ans
end
