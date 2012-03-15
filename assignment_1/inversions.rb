def count_inversions(inversion_array)
  
  # Base Cases
  return [inversion_array, 0] if inversion_array.length == 1 # 1 element array Base Case
  # 2-element array Base Case
  if inversion_array.length == 2
    return inversion_array[0] <= inversion_array[1] ? [inversion_array, 0] : [[inversion_array[1], inversion_array[0]], 1]
  end
  
  upper_split = inversion_array.length
  lower_split = upper_split / 2 - 1
  
  left_array, left_count = count_inversions(inversion_array[0..lower_split])
  right_array, right_count = count_inversions(inversion_array[(lower_split+1)..upper_split])
  
  split_count = 0
  
  left_pointer = 0
  right_pointer = 0
  
  merged_array = []
  
  while(left_pointer < left_array.length or right_pointer < right_array.length)
    
    # If we're done with comparisons, just concatenate and stop
    if left_pointer == left_array.length
      merged_array += right_array[right_pointer..right_array.length]
      break
    elsif right_pointer == right_array.length
      merged_array += left_array[left_pointer..left_array.length]
      break
    end
    
    if left_array[left_pointer] > right_array[right_pointer]
      merged_array << right_array[right_pointer]
      split_count += (left_array.length - left_pointer)
      right_pointer += 1
    else
      merged_array << left_array[left_pointer]
      left_pointer += 1
    end
  end
  
  return merged_array, left_count+right_count+split_count
end

inversion_array = []

File.open("IntegerArray.txt") do |file|
  while (line = file.gets)
    inversion_array << line.to_i
  end
end

#inversion_array = [6,5,4,3,2,1]

sorted_array, inversion_count = count_inversions(inversion_array)
puts inversion_count