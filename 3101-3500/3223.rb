def minimum_length(s)
  char_frequency = Array.new(26, 0)
  total_length = 0
  s.each_char { |char| char_frequency[char.ord - 'a'.ord] += 1 }
  char_frequency.each do |frequency|
    next if frequency == 0
    total_length += frequency.even? ? 2 : 1
  end
  total_length
end
