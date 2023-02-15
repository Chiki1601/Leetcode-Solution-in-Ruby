# @param {Integer[]} a
# @param {Integer} k
# @return {Integer[]}
def add_to_array_form(a, k)
    (a.join.to_i + k).to_s.split("").map {|chr| chr.to_i}
ends
