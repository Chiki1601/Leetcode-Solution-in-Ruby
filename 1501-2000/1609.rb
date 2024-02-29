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
# @return {Boolean}
def is_even_odd_tree(root)
  q = [root]
  lvl = 0

  while !q.empty?
    next_q = []
    
    if lvl.odd?
      # <-
      (q.size - 1).times do |index|
        return false if q[index].val <= q[index + 1].val
      end
    else
      # ->
      (q.size - 1).times do |index|
        return false if q[index].val >= q[index + 1].val
      end
    end
    
    q.each do |node|
      return false if lvl.odd? == node.val.odd?
      
      next_q << node.left if node.left
      next_q << node.right if node.right
    end

    q = next_q
    lvl += 1
  end

  true
end
