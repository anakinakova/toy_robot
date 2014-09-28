require 'test_helper'

class PLACETest
  setup do


  end

  test "will put the toy robot in position X,Y with direction F" do

  end

  test "will not place the robot in an invalid position" do

  end

  test "ignores invalid PLACE command but keeps robot on table" do

  end

end

class InputTest
  setup do

  end

  test "discards anything preceding valid PLACE command" do

  end

  test "processes commands following a valid PLACE command" do

  end

  test "may contain multiple PLACE commands" do

  end

  test "input can be read from stdin" do

  end


  test "input can be read from file if specified" do

  end

end

class MOVETest
  setup do

  end

  test "moves forward one unit if valid" do

  end

  test "ignores command if move will be out of bounds" do

  end

end

class DirectionTest
  setup do

  end

  test "LEFT rotates 90 degrees counter-clockwise" do

  end

  test "RIGHT rotates 90 degrees clockwise" do

  end

  test "does not change `X,Y` of robot" do

  end
end

class REPORTTest
  setup do

  end

  test "gets X,Y and F of robot" do

  end

  test "writes to stdout" do

  end

  test "writes to file if specified" do

  end
end
