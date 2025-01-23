# @param {Integer[][]} grid
# @return {Integer}
def count_servers(grid)
  servers = []
  
  # Collect all the server positions (1s in the grid)
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      servers << [i, j] if cell == 1
    end
  end

  # Count how many servers are in each row and each column
  servers_by_row = Hash.new(0)
  servers_by_col = Hash.new(0)
  
  servers.each do |i, j|
    servers_by_row[i] += 1
    servers_by_col[j] += 1
  end

  # Find rows and columns with exactly one server
  single_server_rows = servers_by_row.select { |_, count| count == 1 }.keys
  single_server_cols = servers_by_col.select { |_, count| count == 1 }.keys

  # Calculate possible isolated servers
  possible_isolated_servers = []
  single_server_rows.each do |i|
    single_server_cols.each do |j|
      possible_isolated_servers << [i, j]
    end
  end

  # Remove isolated servers from the list
  servers.reject { |server| possible_isolated_servers.include?(server) }.size
end
