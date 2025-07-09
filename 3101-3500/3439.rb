# @param {Integer} event_time
# @param {Integer} k
# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @return {Integer}
def max_free_time(event_time, k, start_time, end_time)
  count = start_time.length
  max_free = 0
  prefix_sum = Array.new(count + 1, 0)

  (0...count).each do |i|
    prefix_sum[i + 1] = prefix_sum[i] + end_time[i] - start_time[i]
  end

  (k - 1...count).each do |i|
    occupied = prefix_sum[i + 1] - prefix_sum[i - k + 1]
    window_end = (i == count - 1) ? event_time : start_time[i + 1]
    window_start = (i == k - 1) ? 0 : end_time[i - k]
    max_free = [max_free, window_end - window_start - occupied].max
  end

  max_free
end
