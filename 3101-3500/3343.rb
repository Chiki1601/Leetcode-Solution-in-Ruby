MOD = 10**9 + 7
MAX = 100  

$fact = Array.new(MAX + 1, 1)
$inv_fact = Array.new(MAX + 1, 1)

def precompute_factorials
  (1..MAX).each do |i|
    $fact[i] = $fact[i - 1] * i % MOD
  end
  $inv_fact[MAX] = modinv($fact[MAX])
  (MAX - 1).downto(0) do |i|
    $inv_fact[i] = $inv_fact[i + 1] * (i + 1) % MOD
  end
end

def modinv(a)
  # a^(MOD-2) % MOD
  pow(a, MOD - 2)
end

def pow(a, b)
  res = 1
  while b > 0
    res = res * a % MOD if b.odd?
    a = a * a % MOD
    b >>= 1
  end
  res
end

def comb(n, k)
  return 0 if k < 0 || k > n
  $fact[n] * $inv_fact[k] % MOD * $inv_fact[n - k] % MOD
end

def count_balanced_permutations(num)
  precompute_factorials

  tot = 0
  n = num.length
  cnt = Array.new(10, 0)

  num.each_char do |ch|
    d = ch.to_i
    cnt[d] += 1
    tot += d
  end

  return 0 if tot.odd?

  target = tot / 2
  max_odd = (n + 1) / 2
  f = Array.new(target + 1) { Array.new(max_odd + 1, 0) }
  f[0][0] = 1

  psum = 0
  tot_sum = 0

  (0..9).each do |i|
    psum += cnt[i]
    tot_sum += i * cnt[i]

    [psum, max_odd].min.downto([0, psum - (n - max_odd)].max) do |odd_cnt|
      even_cnt = psum - odd_cnt

      [tot_sum, target].min.downto([0, tot_sum - target].max) do |curr|
        res = 0

        lower = [0, cnt[i] - even_cnt].max
        upper = [cnt[i], odd_cnt].min

        (lower..upper).each do |j|
          break if i * j > curr
          ways = comb(odd_cnt, j) * comb(even_cnt, cnt[i] - j) % MOD
          res = (res + ways * f[curr - i * j][odd_cnt - j] % MOD) % MOD
        end

        f[curr][odd_cnt] = res
      end
    end
  end

  f[target][max_odd]
end
