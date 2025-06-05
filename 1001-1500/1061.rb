# @param {String} s1
# @param {String} s2
# @param {String} base_str
# @return {String}
def smallest_equivalent_string(s1, s2, base_str)
    root = (0..25).to_a
  
    def find(c, root)
        i = c.ord - 'a'.ord
        while root[i] != i
            i = root[i]
        end
        return i
    end
    
    s1.chars.zip(s2.chars).each do |ch1, ch2|
        r1, r2 = find(ch1, root), find(ch2, root)
        if r1 > r2
            r1, r2 = r2, r1
        end
        root[r2] = r1
    end
    
    base_str.chars.map { |c| (find(c, root) + 'a'.ord).chr }.join
    
end
