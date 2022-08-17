# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.empty?

  prefix = ''
  s = strs[0]
  s.length.times.each do |index|
    char = s[index]
    all_has = true
    strs.each do |str|
      all_has &&= str.start_with?(prefix + char)
    end
    return prefix unless all_has

    prefix += char
  end

  prefix
end

p longest_common_prefix %w[flower flow flight]
p longest_common_prefix %w[dog racecar car]
p longest_common_prefix %w[aaa aa aaa]
