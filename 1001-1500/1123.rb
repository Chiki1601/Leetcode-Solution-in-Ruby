def lca_deepest_leaves(root)
    @lca = root
    @deepest = 0
    
    helper(root, 0)
    
    @lca
end

def helper(root, depth)
    @deepest = [@deepest, depth].max
    return depth if root.nil?
    
    left = helper(root.left, depth + 1)
    right = helper(root.right, depth + 1)
    
    @lca = root if left == @deepest && right == @deepest 
    
    [left, right].max
end
