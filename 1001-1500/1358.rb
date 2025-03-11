def number_of_substrings(s)
  a, b, c = 0, 0, 0
  low, high = 0, 0
  ans = 0
  size = s.size
  
  while high < size
    # we increment a if the char at the current index is equal to a. current substring "a"
    a += 1 if s[high] == 'a'
    # we increment b if the char at the current index is equal to b. current substring "ab"
    b += 1 if s[high] == 'b'
    # we increment c if the char at the current index is equal to c. current substring "abc"
    c += 1 if s[high] == 'c'
    
    # If we have a current substring that contains the three chars "a", "b", "c", then we can calculate
    # all the possible substrings that will fullfill the requirements.
    while a > 0 && b > 0 && c > 0
      # by doing s - high we get the total number of substrings that will meet the requirements.
      # And we sum that to the answer.
      ans += size - high
      a -= 1 if s[low] == 'a'
      b -= 1 if s[low] == 'b'
      c -= 1 if s[low] == 'c'
      low+=1
    end
    high += 1
  end
  
  ans
end
