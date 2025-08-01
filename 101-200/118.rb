# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
    result = []
    for i in 0..num_rows-1 do
        curr_row = []
        curr_row << 1

        previous_row = result[i-1]
        if !previous_row.nil? && i > 1
            for i in 1..previous_row.length-1 do
                elm = previous_row[i-1] + previous_row[i]
                curr_row << elm
            end
        end

        if i > 0
            curr_row << 1
        end

        result << curr_row
    end
    result
end
