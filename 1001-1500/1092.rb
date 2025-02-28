# @param {string} str1
# @param {string} str2
# @return {string}
def shortest_common_supersequence(str1, str2)
  # Step 1: Find the longest common subsequence using dynamic programming
  m = str1.length
  n = str2.length
  dp = Array.new(m + 1) { Array.new(n + 1, 0) }
  
  # Fill the dp table
  for i in 1..m
    for j in 1..n
      if str1[i - 1] == str2[j - 1]
        dp[i][j] = 1 + dp[i - 1][j - 1]
      else
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
      end
    end
  end
  
  # Step 2: Construct the shortest common supersequence
  # Start from the bottom right of the dp table
  i = m
  j = n
  result = []
  
  while i > 0 && j > 0
    if str1[i - 1] == str2[j - 1]
      # If the characters are the same, add it once
      result.push(str1[i - 1])
      i -= 1
      j -= 1
    elsif dp[i - 1][j] > dp[i][j - 1]
      # If coming from top has higher value, take character from str1
      result.push(str1[i - 1])
      i -= 1
    else
      # Otherwise, take character from str2
      result.push(str2[j - 1])
      j -= 1
    end
  end
  
  # Add remaining characters from str1 (if any)
  while i > 0
    result.push(str1[i - 1])
    i -= 1
  end
  
  # Add remaining characters from str2 (if any)
  while j > 0
    result.push(str2[j - 1])
    j -= 1
  end
  
  # Reverse the result to get the final supersequence
  return result.reverse.join('')
end
