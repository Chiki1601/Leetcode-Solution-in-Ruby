# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  left = 1
  right = n

  while left < right
    mid = left + (right - left)/ 2

    if is_bad_version mid
      right = mid
    else
      left = mid + 1
    end
  end

  left
end
