
def bubble_sort(array)
  n = array.length
  swapped =  true
  while(swapped)
      swapped = false
      (0...(n - 1)).each do |i|
          if array[i] > array[i + 1]
              temp = array[i]
              array[i] = array[i + 1]
              array[i + 1] = temp
              swapped = true
          end
      end
      n -= 1
  end
  return array
end