# @param {Integer[]} digits
# @return {Integer[]}
def find_even_numbers(digits)
    arr = []
    (50...500).each do |i|
        num = i *= 2
        h, res = num.divmod 100
        t, o = res.divmod 10

        dig = digits.dup
        arr << num if [h,t,o].all? do |n|
          dig.index(n) && dig.delete_at(dig.index(n))
        end
    end

    arr
end
