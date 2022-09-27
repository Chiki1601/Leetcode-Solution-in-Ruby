# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  return [] if intervals.size == 0
  intervals = intervals.sort_by{ |x,y| x }
  output = [intervals[0]]
  j = 0
  for i in 1..intervals.size - 1
    if output[j][1] >= intervals[i][0]
      end_time = [intervals[i][1], output[j][1]].max
      output[j] = [output[j][0], end_time]
    else
      output << intervals[i]
      j = j + 1
    end
  end
  output
end

p merge([[1,3],[2,6],[2, 7], [8,10],[15,18]])
