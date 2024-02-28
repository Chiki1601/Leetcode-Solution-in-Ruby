# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
def build_list(root)
    return [] if root==nil
    left = build_list(root.left)
    right = build_list(root.right)
    ret_array = [[root.val]]
    while left!=[] and right!=[]
        ret_array<<left.shift+right.shift
    end
    return ret_array+left+right
end

# @param {TreeNode} root
# @return {Integer}
def find_bottom_left_value(root)
    ret_array = build_list(root)
    return ret_array[-1][0]    
end
