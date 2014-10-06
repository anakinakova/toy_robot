describe "Move" do
  before :each do
    @robot = ToyRobot::Robot.new
  end

  it "moves forward one unit if valid" do
    @robot.place(2, 3, 'NORTH')
    expect(@robot.get_position).to eq "2,3,NORTH"
    @robot.move
    expect(@robot.get_position).to eq "2,4,NORTH"
  end

  it "ignores command if move will be out of bounds" do
    @robot.place(2, 4, 'NORTH')
    expect(@robot.get_position).to eq "2,4,NORTH"
    @robot.move
    expect(@robot.get_position).to eq "2,4,NORTH"
  end
end
