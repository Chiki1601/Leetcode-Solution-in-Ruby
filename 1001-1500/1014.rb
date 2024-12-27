# @param {Integer[]} values
# @return {Integer}
def max_score_sightseeing_pair(values)
  max = 0
  score = values[0]
  for i in 1 ... values.length()
    score -= 1
    if (score + values[i] > max); max = score + values[i] end
    if (values[i] > score); score = values[i] end
  end
  return max;
end
