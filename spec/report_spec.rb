describe "Report" do
  before :all do
    @robot = ToyRobot::Robot.new
    @robot.place(2, 3, 'EAST')
  end

  it "gets X,Y and F of robot" do
    expect(@robot.get_position).to eq "2,3,EAST"
  end

  # it "writes to stdout" do
  #
  # end

  it "writes to file if specified" do
    @robot.output = File.open('test_out.txt', 'w')
    @robot.report
    @robot.output.close
    output = File.open('test_out.txt', 'r').read
    expect(output).to eq "Output: 2,3,EAST\n"
    system('rm test_out.txt')
  end
end
