# @param {Integer[][]} grid
# @return {Integer[]}
def find_missing_and_repeated_values(grid)
    (grid + [*1..grid.size**2])
        .flatten
        .tally
        .invert
        .minmax
        .reverse
        .map &:last
end
