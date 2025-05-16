def get_words_in_longest_subsequence(n, words, groups)
    adj = Hash.new { |h,k| h[k] = [] }
    @words, @groups = words, groups
    
    (0...n).each do |i|
        (i+1...n).each do |j|
            adj[i] << j if match?(i,j)
        end
    end
    
    max = Hash.new
    (0...n).to_a.reverse.each do |i|
        curr = [nil,0]
        adj[i].each do |k|
            curr = [k,max[k][1]] if max[k][1] > curr[1]
        end
        last,count = curr
        max[i] = [last,count+1]
    end
    
    arr = []
    max.each { |k,v| arr << [k] + v }
    arr.sort_by! { |subarr| subarr[2] }
    start = arr[-1][0]

    res = []
    while start
        res << @words[start]
        start = max[start][0]
    end
    
    res
end

def match?(i,j)
    return false if @groups[i] == @groups[j]
    
    word1, word2 = @words[i], @words[j]
    return false unless word1.length == word2.length
    
    (0...word1.length).one? { |k| word1[k] != word2[k] }
end
