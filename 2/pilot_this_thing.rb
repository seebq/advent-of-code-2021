# read input file
input = File.readlines("input.txt")

horizontal = 0
depth = 0

input.each do |line|
  # regex match command {command} {units}
  # https://rubular.com/r/gA3CtahlHZgpB6
  match_data = line.match(/(?<command>\w+) (?<unit>\d+)/)

  case match_data["command"]
  when "forward"
    horizontal += match_data["unit"].to_i
  when "down"
    depth += match_data["unit"].to_i
  when "up"
    depth -= match_data["unit"].to_i
  end
end

final_position_multiple = horizontal * depth
puts "final horizontal position multiplied by final depth: #{final_position_multiple}"

# part 2

# read input file
input = File.readlines("input.txt")

horizontal = 0
depth = 0
aim = 0

input.each do |line|
  # regex match command {command} {units}
  # https://rubular.com/r/gA3CtahlHZgpB6
  match_data = line.match(/(?<command>\w+) (?<unit>\d+)/)

  case match_data["command"]
  when "forward"
    horizontal += match_data["unit"].to_i
    depth += aim * match_data["unit"].to_i
  when "down"
    aim += match_data["unit"].to_i
  when "up"
    aim -= match_data["unit"].to_i
  end
end

final_position_multiple = horizontal * depth
puts "final horizontal position multiplied by final depth: #{final_position_multiple}"