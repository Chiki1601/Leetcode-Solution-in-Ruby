# @param {String[]} words
# @return {String[]}
def string_matching(words)
  result = Set.new

  words.each_with_index do |word1, i|
    words.each_with_index do |word2, j|
      if i != j && word1.include?(word2)
        result.add(word2)
      end
    end
  end
  
  result.to_a
end
