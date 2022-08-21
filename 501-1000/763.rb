# @param {String} s
# @return {Integer[]}
def partition_labels(s)
  parition_lengths = []
  last_indexes = {}
  s.split('').each_with_index do |char, index|
    last_indexes[char] = index
  end

  index = 0

  while index < s.length
    char = s[index]
    end_index = last_indexes[char]

    j = index
    while j < end_index
      end_index = [end_index, last_indexes[s[j]]].max
      j += 1
    end

    parition_lengths.push j - index + 1
    index = j + 1

  end
  parition_lengths
end

p partition_labels('ababcbacadefegdehijhklij')
