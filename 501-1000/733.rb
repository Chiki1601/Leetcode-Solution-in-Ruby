def flood_fill(image, sr, sc, new_color)
  return image if image[sr][sc] == new_color

  current_color = image[sr][sc]
  rows = image.size
  columns = image[0].size
  fill(image, sr, sc, new_color, current_color, rows, columns)
end

def fill(image, sr, sc, new_color, current_color, rows, columns)
  return if (sr.negative? || sr > rows - 1 || sc.negative? || sc > columns - 1) || image[sr][sc] != current_color || image[sr][sc] == new_color

  image[sr][sc] = new_color
  fill(image, sr - 1, sc, new_color, current_color, rows, columns)
  fill(image, sr + 1, sc, new_color, current_color, rows, columns)
  fill(image, sr, sc - 1, new_color, current_color, rows, columns)
  fill(image, sr, sc + 1, new_color, current_color, rows, columns)
  image
end

p flood_fill [[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2
