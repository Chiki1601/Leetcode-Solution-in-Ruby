# @param {Integer[]} nums
# @return {Integer}
# @param {Integer[]} a
# @return {Integer}
def largest_perimeter(a)
    a = a.sort.reverse
    for i in 0...a.length-2
        for j in i+1...a.length-1
            break if a[j]<a[i]/2
            for k in j+1...a.length
                if a[j]+a[k]>a[i]
                    return a[i]+a[j]+a[k]
                else
                    break
                end
            end
        end
    end
    return 0
end
