# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  return nil if head.nil?

  data = {}
  new_head = Node.new(head.val)
  data[head] = new_head
  current_node = head.next
  current_new_node = new_head
  until current_node.nil?
    new_node = Node.new(current_node.val)
    data[current_node] = new_node
    current_new_node.next = new_node
    current_new_node = current_new_node.next
    current_node = current_node.next
  end

  new_current = new_head
  until head.nil?
    new_current.random = data[head.random] unless head.random.nil?
    head = head.next
    new_current = new_current.next
  end

  new_head
end
