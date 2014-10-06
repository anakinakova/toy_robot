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
      @direction *= Complex(0, 1)
      debug_report
    end

    def right
      @direction *= Complex(0, -1)
      debug_report
    end

    def report
      if @position.nil?
        INVALID_POSITION
      else
        "#{@position.real},#{@position.imag},#{get_direction}"
      end
    end

    def print_report
      p "Output: #{report}"
    end

    def debug_report
      if ENV['DEBUG']
        print_report
      end
    end

    def self.valid_f? f
      DIRECTIONS.keys.include? f
    end

    def self.valid_xy? x, y
      (0..4).to_a.include? [x, y].max
    end

    private

    def get_direction
      DIRECTIONS.select do |_,v|
        v == @direction
      end.keys.first
    end
  end
end
