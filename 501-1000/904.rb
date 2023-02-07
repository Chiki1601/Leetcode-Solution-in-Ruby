# @param {Integer[]} tree
# @return {Integer}
def total_fruit(tree)
    # a = nil
    # b = nil
    # count_a = 0
    # count_b = 0
    types = {}
    i = 0
    n = tree.length
    max = 0
    new_type = false
    while i < n
        if types.keys.length < 2
            types[tree[i]] ||= 0
            types[tree[i]] += 1 
            # max = types.values.sum >= max ? types.values.sum : max
        else
            if types[tree[i]]
                types[tree[i]] += 1
                max = types.values.sum >= max ? types.values.sum : max
            else
                new_type = true
            end  
        end
        max = types.values.sum >= max ? types.values.sum : max
        if new_type
          i -= types.values.max
          types = {}
          new_type = false  
        else
            i += 1    
        end    
    end
    max
end
