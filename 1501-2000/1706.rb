# @param {Integer[][]} grid
# @return {Integer[]}
def find_ball(grid)
    m, n = grid.size, grid[0].size
    res = Array.new(n)
    n.times do |k|  # Iterating every of n balls.
        j = k       # Initial column of the ball has index k.
        m.times do |i|  # Iterating rows while the ball is moving down.
            val = grid[i][j]
            next_j = j + val    # If val == 1 we'll go to the right (j + 1) and if val == -1 we'll go to the left (j - 1)
            break res[k] = -1 unless next_j.between?(0, n - 1) && val == grid[i][next_j] # Check for the walls and V-shape
            res[k] = next_j if i == m - 1   # k'th ball has reached the finish! At column next_j.
            j = next_j  # On the next row the ball will be at the column next_j.
        end
    end
    res
end
