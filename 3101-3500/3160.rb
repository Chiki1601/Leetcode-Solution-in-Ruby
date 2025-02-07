# @param {Integer} limit
# @param {Integer[][]} queries
# @return {Integer[]}
def query_results(limit, queries)
    ball = {}
    color = {}
    ans = []
    distinct = 0

    queries.each do |pos, c|
        if ball.key?(pos)
            cnt = color[ball[pos]] - 1
            if cnt == 0
                color.delete(ball[pos])
                distinct -= 1
            else
                color[ball[pos]] = cnt
            end
        end
        
        ball[pos] = c
        cnt = (color[c] || 0) + 1
        color[c] = cnt
        
        if cnt == 1
            distinct += 1
        end
        
        ans << distinct
    end
    
    ans
end
