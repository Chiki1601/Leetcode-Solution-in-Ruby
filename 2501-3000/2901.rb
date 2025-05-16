# @param {String[]} words
# @param {Integer[]} groups
# @return {String[]}
def get_words_in_longest_subsequence(words, groups)
  def is_one_char_diff(s1, s2)
    diff = false

    (0...s1.length).each do |i|
      if s1[i] != s2[i]
        return false if diff
        diff = true
      end
    end

    diff
  end

  dp = [1]
  prev = [-1]

  max_len = 1
  i_max_len = 0

  (1...words.length).each do |i|
    cur_group = groups[i]
    cur_word = words[i]
    cur_len = 1
    cur_prev = -1

    (i - 1).downto(0) do |j|
      next if cur_word.length != words[j].length
      next if cur_group == groups[j]
      next if cur_len > dp[j]
      next unless is_one_char_diff(cur_word, words[j])

      cur_len = 1 + dp[j]
      cur_prev = j
    end

    dp << cur_len
    prev << cur_prev

    if cur_len > max_len
      max_len = cur_len
      i_max_len = i
    end
  end

  result = []
  i = i_max_len
  while i != -1
    result.unshift(words[i])
    i = prev[i]
  end

  result
end
