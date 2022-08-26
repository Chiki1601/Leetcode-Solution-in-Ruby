# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  order_data = {}
  order.split('').each_with_index do |item, index|
    order_data[item] = index
  end
  (0..(words.length - 2)).to_a.each do |i|
    current_word = words[i]
    next_word = words[i + 1]
    current_word.split('').each_with_index do |current_word_char, index|
      next_word_char = next_word[index]
      return false if next_word_char.nil?
      break if order_data[current_word_char] < order_data[next_word_char]
      return false if order_data[current_word_char] > order_data[next_word_char]
    end
  end
  true
end

words = %w[hello leetcode]
order = 'hlabcdefgijkmnopqrstuvwxyz'
p is_alien_sorted(words, order)

words = %w[word world row]
order = 'worldabcefghijkmnpqstuvxyz'
p is_alien_sorted(words, order)
