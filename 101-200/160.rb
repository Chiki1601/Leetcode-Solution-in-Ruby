# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  data = {}
  until headA.nil?
    data[headA] = true
    headA = headA.next
  end

  until headB.nil?
    return headB if data[headB]
    headB = headB.next
  end
end
