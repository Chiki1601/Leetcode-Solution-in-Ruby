# @param {Integer[][]} dimensions
# @return {Integer}
def area_of_max_diagonal(dimensions)
  dimensions.max_by { |(x, y)| [x * x + y * y, x * y] }.reduce(1, &:*)
end
