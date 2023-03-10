=begin
    @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node.
    :type head: ListNode
=end
    def initialize(head)
        @arr = []
        while head!=nil
            @arr<<head.val
            head=head.next
        end
        @count = @arr.length
    end


=begin
    Returns a random node's value.
    :rtype: Integer
=end
    def get_random()
        @arr[rand(@count)]
    end
	
