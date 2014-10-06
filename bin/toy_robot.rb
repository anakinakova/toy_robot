#! /usr/bin/env ruby
require ::File.expand_path('../../lib/toy_robot',  __FILE__)

def process_file(robot, filename)
  file = File.open(filename, 'r')
  unless file
    print "ERROR", "Unable to open file #{file}.\n"
    return
  end
  file.each_line do |line|
    execute_command(robot, parse_command(line))
  end
end

# PLACE X,Y,F
# MOVE
# LEFT
# RIGHT
# REPORT
def parse_command(line)
  line = line.strip
  if %w(MOVE LEFT RIGHT REPORT).include? line
    return line.downcase
  end

  if (line =~ /PLACE/) == 0
    args = line[5..-1].strip.split(',')
    return 'place', *args
  end
end

def execute_command(robot, args)
  p args
  if args.is_a? Array
    robot.send(*args)
  elsif args.is_a? String
    robot.send(args)
  end
end

print "Toy Robot Simulator\n"
print "-- Ana Djordjevic, 2014\n\n"

robot = ToyRobot::Robot.new

unless ARGV[0].nil?
  process_file(robot, ARGV[0])
  return
end

print "Interactive mode - enter commands one line at a time:\n"
print "Ctrl-D to exit.\n\n"
print "<robot> "

STDIN.each_line do |line|
  execute_command(robot, parse_command(line))
  print "<robot> "
end
