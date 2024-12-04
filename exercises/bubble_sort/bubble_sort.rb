# frozen_string_literal: true

def bubble_sort(array)
  n = array.length
  swapped = true
  while swapped
    swapped = false
    (0...(n - 1)).each do |i|
      next unless array[i] > array[i + 1]

      temp = array[i]
      array[i] = array[i + 1]
      array[i + 1] = temp
      swapped = true
    end
    n -= 1
  end
  array
end
