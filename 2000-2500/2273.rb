# @param {String[]} words
# @return {String[]}
def remove_anagrams(words)
    [*1...words.length].each do |i|
        if words[i].chars.sort == words[i-1].chars.sort
            words.delete_at(i) 
            words.unshift(nil)
        end
    end
    words - [nil]
end
