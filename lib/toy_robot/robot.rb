module ToyRobot
  class Robot
    PI_ON_2 = Math::PI / 2

    # directions represented by angles of complex numbers/vectors
    DIRECTIONS = {
        'NORTH' => Complex(0, 1), #PI_ON_2,
        'WEST'  => Complex(-1, 0), #Math::PI,
        'SOUTH' => Complex(0, -1), #-PI_ON_2,
        'EAST'  => Complex(1, 0) # 0
    }

    INVALID_POSITION = "The robot is not in a valid position on the board."

    def initialize
      @position  = nil
      @direction = nil
    end

    def place(x, y, f)
      x = x.to_i
      y = y.to_i
      if Robot.valid_f?(f) && Robot.valid_xy?(x, y)
        @position  = Complex(x, y)
        @direction = DIRECTIONS[f]
      end
      debug_report
    end

    def move
      return if @position.nil? || @direction.nil?
      tmp = @position + @direction
      if Robot.valid_xy?(tmp.real, tmp.imag)
        @position = tmp
      end
      debug_report
    end

    def left
      return if @position.nil? || @direction.nil?
      @direction *= Complex(0, 1)
      debug_report
    end

    def right
      return if @position.nil? || @direction.nil?
      @direction *= Complex(0, -1)
      debug_report
    end

    def get_position
      if @position.nil?
        INVALID_POSITION
      else
        "#{@position.real},#{@position.imag},#{get_direction}"
      end
    end

    def report
      print "Output: #{get_position}\n"
    end

    def debug_report
      if ENV['DEBUG']
        report
      end
    end

    def self.valid_f? f
      DIRECTIONS.keys.include? f
    end

    def self.valid_xy? x, y
      (self.valid_c? x) && (self.valid_c? y)
    end

    def self.valid_c? c
      (0..4).to_a.include? c
    end

    private

    def get_direction
      DIRECTIONS.select do |_,v|
        v == @direction
      end.keys.first
    end
  end
end
