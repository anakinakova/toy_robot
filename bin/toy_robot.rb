#! /usr/bin/env ruby
require ::File.expand_path('../../lib/toy_robot',  __FILE__)

def process_input(robot)
  input = robot.input
  input.each_line do |line|
    execute_command(robot, parse_command(line))
    print "<robot> " if input == STDIN
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
  if args.is_a? Array
    robot.send(*args)
  elsif args.is_a? String
    robot.send(args)
  end
end

def parse_args(args)
  i = args.find_index("-i")
  if i.nil?
    input = STDIN
  else
    filename = args[i + 1]
    input = File.open(filename, 'r')
    if input.nil?
      print "ERROR", "Unable to open file #{filename}.\n"
      print "Falling back to interactive mode.\n"
    end
  end

  o = args.find_index("-o")
  if o.nil?
    output = STDOUT
  else
    filename = args[o + 1]
    output = File.open(filename, 'w')
    if output.nil?
      print "ERROR", "Unable to open file #{filename}.\n"
      print "Writing output to standard output.\n"
    end
  end

  [input, output]
end

robot = ToyRobot::Robot.new(*parse_args(ARGV))
if robot.input == STDIN
  print "Toy Robot Simulator\n"
  print "-- Ana Djordjevic, 2014\n\n"
  print "Interactive mode - enter commands one line at a time:\n"
  print "Ctrl-D to exit.\n\n"
  print "<robot> "
end
process_input(robot)
