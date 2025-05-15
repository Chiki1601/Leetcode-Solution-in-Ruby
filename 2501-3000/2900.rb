# @param {String[]} words
# @param {Integer[]} groups
# @return {String[]}
def get_longest_subsequence(words, groups)
  groups.zip(words).chunk { |ӯ, _| ӯ }.map { |(_, ((_, ӯ), *))| ӯ }  
end
