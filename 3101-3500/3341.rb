class Numeric
    def min(v) = (self < v ? self : v)
    def max(v) = (self > v ? self : v)
end

class NilClass
    def min(v) = v
    def max(v) = v
    def >(v) = true
end

class Grid
    attr_reader :grid, :h, :w, :hm1, :wm1

    def initialize(grid)
        @grid, @h, @w = grid, grid.size, grid.first.size
        @hm1, @wm1 = h - 1, w - 1
    end

    def neighbs(r, c)
        Enumerator.new {|y|
            y << [r - 1, c] if r > 0
            y << [r + 1, c] if r < hm1
            y << [r, c - 1] if c > 0
            y << [r, c + 1] if c < wm1
        }
    end

    def solve
        i, q = 0, [[0, 0, 0]] # r, c, t
        (times = Array.new(h) { Array.new(w) })[0][0] = 0
        while i < q.size do
            r, c, t = q[(i += 1) - 1]
            neighbs(r, c).each {|(r1, c1)|
                t1 = (t+1).max(grid.dig(r1, c1) + 1)
                (q << [r1, c1, times[r1][c1] = t1]) if times.dig(r1, c1) > t1
            }
        end
        times.last.last
    end
end

def min_time_to_reach(move_time) = Grid.new(move_time).solve
