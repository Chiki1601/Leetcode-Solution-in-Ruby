# @param {String[]} words1
# @param {String[]} words2
# @return {String[]}
def word_subsets(words1, words2)
  # Initialize the maximum frequency required for each character
  max_frequencies = [0] * 26  # For letters 'a' to 'z'
  letters_needed = Set.new    # Track letters needed

  # Function to count character frequencies in a word
  def count_frequencies(word)
    frequencies = [0] * 26
    word.each_char do |char|
      idx = char.ord - 'a'.ord
      frequencies[idx] += 1
    end
    frequencies
  end

  # Compute maximum frequencies from words2
  words2.each do |word|
    word_frequencies = count_frequencies(word)
    (0...26).each do |i|
      if word_frequencies[i] > max_frequencies[i]
        max_frequencies[i] = word_frequencies[i]
        letters_needed.add(i)
      end
    end
  end

  # Convert letters_needed to an array for faster iteration
  letters_needed_array = letters_needed.to_a

  # Array to store universal words
  universal_words = []

  # Check each word in words1
  words1.each do |word|
    word_frequencies = count_frequencies(word)
    is_universal = true
    letters_needed_array.each do |i|
      if word_frequencies[i] < max_frequencies[i]
        is_universal = false
        break
      end
    end
    universal_words << word if is_universal
  end

  universal_words
end
