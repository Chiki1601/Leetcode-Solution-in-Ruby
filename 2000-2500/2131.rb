# @param {String[]} words
# @return {Integer}
def longest_palindrome(words)
    map = Hash.new(0)
    result = 0
    unpaired = 0
    
    words.each do |word|
        if word[0] == word[1]
            if map[word] > 0
                unpaired -= 1
                result += 4
                map[word] -=1
            else
                unpaired += 1
                map[word] += 1
            end
        else
            reverse = word.reverse
            
            if map.include?(reverse) && map[reverse] > 0
                result += 4
                map[reverse] -= 1
            else
                map[word] += 1
            end
        end
    end
    
    result += 2 if unpaired > 0
    result
end
