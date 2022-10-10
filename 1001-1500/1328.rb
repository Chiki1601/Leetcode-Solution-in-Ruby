# @param {String} palindrome
# @return {String}
def break_palindrome(s)
  !s[1] ? '' : s[/^(a+).?\1$/] ? s.chop+?b : s.sub(/[^a]/,?a)
end
