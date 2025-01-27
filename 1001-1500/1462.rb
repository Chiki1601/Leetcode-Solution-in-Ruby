# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @param {Integer[][]} queries
# @return {Boolean[]}
def check_if_prerequisite(num_courses, prerequisites, queries)
  # Initialize outgoing edges
  outs = Array.new(num_courses) { [] }

  # Populate indegrees and outgoing edges
  ins = Array.new(num_courses, 0)
  prerequisites.each do |pre|
    ins[pre[1]] += 1
    outs[pre[0]] << pre[1]
  end

  # Populate prerequisite matrix
  matrix = Array.new(num_courses) { [] }
  (0...num_courses).each do |i|
    if ins[i] == 0 && matrix[i].empty?
      matrix[i] = Array.new(num_courses, false)
      dfs(ins, outs, matrix, i)
    end
  end

  # Populate answers
  answer = queries.map do |query|
    matrix[query[1]][query[0]] == true
  end

  return answer
end

# @param {Array} ins
# @param {Array} outs
# @param {Array} matrix
# @param {Integer} vertex
def dfs(ins, outs, matrix, vertex)
  outs[vertex].each do |next_vertex|
    if matrix[next_vertex].empty?
      matrix[next_vertex] = matrix[vertex].dup
    else
      matrix[next_vertex] = merge_rows(matrix[next_vertex], matrix[vertex])
    end
    matrix[next_vertex][vertex] = true
    if (ins[next_vertex] -= 1) == 0
      dfs(ins, outs, matrix, next_vertex)
    end
  end
end

# @param {Array} target
# @param {Array} source
# @return {Array}
def merge_rows(target, source)
  source.each_with_index do |val, i|
    target[i] ||= val
  end
  target
end
