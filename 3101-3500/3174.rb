# @param {String} s
# @return {String}
def clear_digits(s)
  res = ""
  s.each_char do |c|
    if c =~ /[0-9]/
      if res.length > 0
        res = res[0..-2]  # Remove last character
      end
    else
      res += c
    end
  end
  res
end
