
def gcd_of_strings(str1, str2)
    (0...[str1.size,str2.size].min).reverse_each do |i|
        str = str1[0..i]
        regex = Regexp.new("^(#{str})+$")
        return str if  regex === str1 && regex === str2
    end
    ""
end
