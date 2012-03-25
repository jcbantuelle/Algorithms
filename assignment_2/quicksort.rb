def quicksort_one(quicksort)
  
  # Base Case
  return quicksort, 0 if quicksort.length == 1
  
  pivot = quicksort[0]
  i = 1
  1.upto(quicksort.length - 1) do |j|
  
    if quicksort[j] < pivot
      temp = quicksort[j]
      quicksort[j] = quicksort[i]
      quicksort[i] = temp
      i += 1
    end
  end
  
  quicksort[0] = quicksort[i-1]
  quicksort[i-1] = pivot
  
  lower_range = i-2
  upper_range = quicksort.length
  
  if lower_range >= 0
    lower_partition = quicksort[0..lower_range]
    lower_quicksort, lower_total = quicksort_one(lower_partition)
    lower_total += (lower_partition.length - 1)
  else
    lower_quicksort = []
    lower_total = 0
  end
  
  if i < upper_range
    upper_partition = quicksort[i..upper_range]
    upper_quicksort, upper_total = quicksort_one(upper_partition)
    upper_total += (upper_partition.length - 1)
  else
    upper_quicksort = []
    upper_total = 0
  end
  
  quicksort = lower_quicksort + [pivot] + upper_quicksort  
  return quicksort, lower_total + upper_total
end

def quicksort_two(quicksort)
  
  # Base Case
  return quicksort, 0 if quicksort.length == 1
  
  pivot = quicksort[quicksort.length-1]
  temp = quicksort[0]
  quicksort[0] = pivot
  quicksort[quicksort.length-1] = temp
  
  i = 1
  1.upto(quicksort.length - 1) do |j|
  
    if quicksort[j] < pivot
      temp = quicksort[j]
      quicksort[j] = quicksort[i]
      quicksort[i] = temp
      i += 1
    end
  end
  
  quicksort[0] = quicksort[i-1]
  quicksort[i-1] = pivot
  
  lower_range = i-2
  upper_range = quicksort.length
  
  if lower_range >= 0
    lower_partition = quicksort[0..lower_range]
    lower_quicksort, lower_total = quicksort_two(lower_partition)
    lower_total += (lower_partition.length - 1)
  else
    lower_quicksort = []
    lower_total = 0
  end
  
  if i < upper_range
    upper_partition = quicksort[i..upper_range]
    upper_quicksort, upper_total = quicksort_two(upper_partition)
    upper_total += (upper_partition.length - 1)
  else
    upper_quicksort = []
    upper_total = 0
  end
  
  quicksort = lower_quicksort + [pivot] + upper_quicksort  
  return quicksort, lower_total + upper_total
end

def quicksort_three(quicksort)
  
  # Base Case
  return quicksort, 0 if quicksort.length == 1
  
  pivot_index = 0
  
  pivot_one = quicksort[0]
  middle = quicksort.length % 2 == 0 ? (quicksort.length/2)-1 : quicksort.length/2
  pivot_two = quicksort[middle]
  pivot_three = quicksort[quicksort.length-1]
  
  pivot_index = 0 if (pivot_one < pivot_two and pivot_one > pivot_three) or (pivot_one > pivot_two and pivot_one < pivot_three)
  pivot_index = middle if (pivot_two < pivot_one and pivot_two > pivot_three) or (pivot_two > pivot_one and pivot_two < pivot_three)
  pivot_index = quicksort.length-1 if (pivot_three < pivot_one and pivot_three > pivot_two) or (pivot_three > pivot_one and pivot_three < pivot_two)
  
  pivot = quicksort[pivot_index]
  temp = quicksort[0]
  quicksort[0] = pivot
  quicksort[pivot_index] = temp
  
  i = 1
  1.upto(quicksort.length - 1) do |j|
  
    if quicksort[j] < pivot
      temp = quicksort[j]
      quicksort[j] = quicksort[i]
      quicksort[i] = temp
      i += 1
    end
  end
  
  quicksort[0] = quicksort[i-1]
  quicksort[i-1] = pivot
  
  lower_range = i-2
  upper_range = quicksort.length
  
  if lower_range >= 0
    lower_partition = quicksort[0..lower_range]
    lower_quicksort, lower_total = quicksort_three(lower_partition)
    lower_total += (lower_partition.length - 1)
  else
    lower_quicksort = []
    lower_total = 0
  end
  
  if i < upper_range
    upper_partition = quicksort[i..upper_range]
    upper_quicksort, upper_total = quicksort_three(upper_partition)
    upper_total += (upper_partition.length - 1)
  else
    upper_quicksort = []
    upper_total = 0
  end
  
  quicksort = lower_quicksort + [pivot] + upper_quicksort  
  return quicksort, lower_total + upper_total
end

quicksort = []

File.open("QuickSort.txt") do |file|
  while (line = file.gets)
    quicksort << line.to_i
  end
end

quicksort, total = quicksort_three(quicksort)
total = total + quicksort.length - 1
puts total