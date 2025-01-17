# @param {Integer[]} derived
# @return {Boolean}
def does_valid_array_exist(derived)
    derived.inject(:^) == 0
end
