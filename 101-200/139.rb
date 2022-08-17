# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(string, word_dict)
  data = {}
  word_dict.each do |word|
    data[word] = true
  end
  result = Array.new(string.size + 1, false)
  result[0] = true
  for i in 1..string.size
    for j in 0..i-1
      if result[j] && data[string[j..i-1]]
        result[i] = true
        break
      end
    end
  end
  result[string.size]
end


p word_break("leetcode",  ["leet", "code"])
p word_break("catsandog",  ["cats", "dog", "sand", "and", "cat"])
