def sort_array_by_parity(a)
  start_index = 0
  end_index = a.length - 1

  while (start_index < end_index)

    if a[start_index].odd? && a[end_index].even?
      temp = a[start_index]
      a[start_index] = a[end_index]
      a[end_index] = temp
    end

    start_index += 1 if a[start_index].even?

    end_index -= 1 if a[end_index].odd?
  end
  a
end
