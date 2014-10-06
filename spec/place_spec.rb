describe "Place" do
  before :each do
    @robot = ToyRobot::Robot.new
  end

  it "will put the toy robot in position X,Y with direction F" do
    @robot.place(2, 3, 'NORTH')
    expect(@robot.report).to eq "2,3,NORTH"
  end

  it "will not place the robot in an invalid position" do
    @robot.place(7, 1, 'SOUTH')
    expect(@robot.report).to eq @robot.class::INVALID_POSITION

  end

  it "ignores invalid PLACE command but keeps robot on table" do
    @robot.place(4, 3, 'SOUTH')
    @robot.place(8, 3, 'NORTH')
    expect(@robot.report).to eq "4,3,SOUTH"
  end
end
