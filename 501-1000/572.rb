# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree(s, t)
  traverse(s, t)
end

def equals(s, t)
  return true if s.nil? && t.nil?
  return false if s.nil? || t.nil?

  (s.val == t.val) && equals(s.left, t.left) && equals(s.right, t.right)
  # code here
end

def traverse(s, t)
  !s.nil? && (
      equals(s, t) || traverse(s.left, t) || traverse(s.right, t)
  )
end
