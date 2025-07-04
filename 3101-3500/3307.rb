# @param {Integer} k
# @param {Integer[]} operations
# @return {Character}
def kth_character(k, operations)
  k -= 1  # Convert to 0-based index
  c = 0

  (operations.length - 1).downto(0) do |i|
    if (k >> i) & 1 == 1
      c += operations[i]
    end
  end

  return ('a'.ord + c % 26).chr
end
