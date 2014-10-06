describe "Direction" do
  before :each do
    @robot = ToyRobot::Robot.new
    @robot.place(2, 3, 'NORTH')
  end

  it "LEFT rotates 90 degrees counter-clockwise" do
    expect(@robot.get_position).to eq "2,3,NORTH"
    @robot.left
    expect(@robot.get_position).to eq "2,3,WEST"
    @robot.left
    expect(@robot.get_position).to eq "2,3,SOUTH"
    @robot.left
    @robot.left
    expect(@robot.get_position).to eq "2,3,NORTH"
  end

  it "RIGHT rotates 90 degrees clockwise" do
    expect(@robot.get_position).to eq "2,3,NORTH"
    @robot.right
    expect(@robot.get_position).to eq "2,3,EAST"
    @robot.right
    @robot.right
    expect(@robot.get_position).to eq "2,3,WEST"
  end

  it "does not change `X,Y` of robot" do
    @robot.right
    expect(@robot.get_position.split(',')[0..1]).to eq ["2", "3"]
    @robot.left
    @robot.left
    expect(@robot.get_position.split(',')[0..1]).to eq ["2", "3"]
    @robot.right
    expect(@robot.get_position.split(',')[0..1]).to eq ["2", "3"]
  end
end
