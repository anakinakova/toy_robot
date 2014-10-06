describe "Place" do
  before :each do
    @robot = ToyRobot::Robot.new
  end

  it "will put the toy robot in position X,Y with direction F" do
    %w(NORTH SOUTH EAST WEST).each do |f|
      @robot.place(2, 3, f)
      expect(@robot.get_position).to eq "2,3,#{f}"
    end
  end

  it "will not place the robot in an invalid position" do
    @robot.place(7, 1, 'SOUTH')
    expect(@robot.get_position).to eq @robot.class::INVALID_POSITION
  end

  it "ignores invalid PLACE command but keeps robot on table" do
    @robot.place(4, 3, 'SOUTH')
    @robot.place(8, 3, 'NORTH')
    expect(@robot.get_position).to eq "4,3,SOUTH"
  end
end
