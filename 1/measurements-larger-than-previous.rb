# part 1

current_measurement, previous_measurement = nil
increased_measurement_count = 0

File.foreach("input") do |line|
  line.strip!
  current_measurement = line.to_i
  if previous_measurement.nil?
    puts "#{line} (N/A - no previous measurement)"
    previous_measurement = current_measurement
    next
  end
  if current_measurement > previous_measurement
    puts "#{line} (increased)"
    increased_measurement_count += 1
  elsif current_measurement < previous_measurement
    puts "#{line} (decreased)"
  elsif current_measurement == previous_measurement
    puts "#{line} (same)"
  else
    puts "#{line}" # shouldn't get here
  end
  previous_measurement = current_measurement
end

puts "There are #{increased_measurement_count} measurements that are larger than the previous measurement."

# part 2

# array = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
array = File.readlines("input")

window_size = 3
current_window_sum = 0
previous_window_sum = 0
increased_window_sum_count = 0

i = 0
while i < array.length do
  current_window_sum += array[i].to_i

  if i >= window_size-1
    if previous_window_sum == 0
      puts "#{current_window_sum} (N/A - no previous sum)"
    elsif current_window_sum > previous_window_sum
      puts "#{current_window_sum} (increased)"
      increased_window_sum_count += 1
    elsif current_window_sum < previous_window_sum
      puts "#{current_window_sum} (decreased)"
    elsif current_window_sum == previous_window_sum
      puts "#{current_window_sum} (no change)"
    else
      puts "#{current_window_sum}" # shouldn't get here
    end
    previous_window_sum = current_window_sum
    # shift the window
    current_window_sum -= array[i - (window_size-1)].to_i
  end

  i += 1
end

puts "There are #{increased_window_sum_count} sums that are larger than the previous sum."

