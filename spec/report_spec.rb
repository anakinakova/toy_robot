describe "Report" do

  before :all do
    @robot = ToyRobot::Robot.new
    @robot.place(2, 3, 'EAST')
  end

  it "gets X,Y and F of robot" do
    expect(@robot.report).to eq "2,3,EAST"
  end

  it "writes to stdout" do
    expect(@robot.print_report).to eq "Output: 2,3,EAST"
  end

  # it "writes to file if specified" do
  #
  # end
end