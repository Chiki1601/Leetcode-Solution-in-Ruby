class String
    def remove(removing)
        a, b = removing.chars
        stack = each_char.each_with_object([]) {|c, stk|
            if c == b && stk.last == a then
                stk.pop
            else
                stk << c    
            end
        }

        [stack.join, (size - stack.size) / 2]
    end
end

def maximum_gain(s, x, y) = [['ab', x], ['ba', y]].sort_by(&:last).reverse.inject(0) {|res, (patrn, cost)| res + (s, val = s.remove(patrn)).last * cost }
