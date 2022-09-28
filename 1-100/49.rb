# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  data = {}
  strs.each do |str|
    sorted = str.chars.sort.join
    data[sorted] = data.fetch(sorted, []).push str
  end

  data.values
end

p group_anagrams %w[eat tea tan ate nat bat]
p group_anagrams ['']
p group_anagrams ['a']
