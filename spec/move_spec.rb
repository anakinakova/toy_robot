describe "Move" do
  before :each do
    @robot = ToyRobot::Robot.new
  end

  valid_range = (0..4).to_a

  it "moves forward one unit if valid" do
    ToyRobot::Robot::DIRECTIONS.each do |k,v|
      valid_range.each do |x|
        valid_range.each do |y|
          @robot.place(x, y, k)
          expect(@robot.get_position).to eq "#{x},#{y},#{k}"
          @robot.move
          if v.imag == 0 # +/- x direction
            _y = y
            _x = x
            _x = x + v.real if valid_range.include? (x + v.real)
          else
            _x = x
            _y = y
            _y = y + v.imag if valid_range.include? (y + v.imag)
          end
          expect(@robot.get_position).to eq "#{_x},#{_y},#{k}"
        end
      end
    end
  end

  it "ignores command if move will be out of bounds" do
    @robot.place(2, 4, 'NORTH')
    expect(@robot.get_position).to eq "2,4,NORTH"
    @robot.move
    expect(@robot.get_position).to eq "2,4,NORTH"
  end
end
