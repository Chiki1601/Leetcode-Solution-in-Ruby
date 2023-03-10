module Enumerable
    def random_choice
        each_with_index.inject(nil) {|r, (v, idx)|
            rand(idx+1).zero? ? yield(v) : r
        }
    end
end

class ListNode
    include Enumerable
    
    def each
        yield(cur = self)
        yield(cur = cur.next) until cur.next.nil?
    end
end

class Solution
    attr_reader :head

    def initialize(head)
        @head = head
    end

    def get_random()
        head.random_choice(&:val)
    end
end
