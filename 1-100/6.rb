# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(string, n_rows)
  c = string.chars
  len = c.length
  string_buffer = []
  n_rows.times do
    string_buffer.push("")
  end
  i = 0
  while i < len
    idx = 0
    while idx < n_rows  && i < len
      puts idx
      string_buffer[idx] += c[i]
      i += 1
      idx += 1
    end

    idx -= 2
    while idx > 0 && i < len
      string_buffer[idx] += c[i]
      idx -= 1
      i += 1
    end
  end
  return string_buffer.join("")
end
