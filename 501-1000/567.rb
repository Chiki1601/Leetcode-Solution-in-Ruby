# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  return false if s1.length > s2.length

  s1_counter = [0] * 26
  s2_counter = [0] * 26
  idx = 0

  while idx < s1.length do
    ch = s1[idx]
    s1_counter[ch.ord - 'a'.ord] += 1
    ch = s2[idx]
    s2_counter[ch.ord - 'a'.ord] += 1
    idx += 1
  end

  while idx < s2.length do
    return true if s1_counter == s2_counter

    first_ch_in_window = s2[idx - s1.length]
    s2_counter[first_ch_in_window.ord - 'a'.ord] -= 1

    curr_ch = s2[idx]
    s2_counter[curr_ch.ord - 'a'.ord] += 1

    idx += 1
  end

  s1_counter == s2_counter
end
