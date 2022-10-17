# @param {String} sentence
# @return {Boolean}
def check_if_pangram(sentence)
  st = Set.new

  sentence.each_char do |c|
    st << c
  end

  st.size == 26
end
