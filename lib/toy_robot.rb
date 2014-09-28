require "toy_robot/version"

# Assume X [0..4] and Y [0..4]
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

    def initialize
      @position  = nil
      @direction = nil
    end

    def place(x, y, f)
      if valid_f(f) && valid_xy(x, y)
        @position  = Complex(x, y)
        @direction = DIRECTIONS[f]
      end
      report
    end

    def move
      return if @position.nil? || @direction.nil?
      tmp = @position + Complex.polar(1, @direction)
      if valid_xy(tmp.real, tmp.imag)
        @position = tmp
      end
      report
    end

    def left
      @direction *= Complex(0, 1)
      report
    end

    def right
      @direction *= Complex(0, -1)
      report
    end

    def report
      p "Output: #{@position.real},#{@position.imag},#{get_direction}"
    end

    private

    def valid_f f
      DIRECTIONS.keys.include? f
    end

    def valid_xy x, y
      (0..4).to_a.include? x && y
    end

    def get_direction
      DIRECTIONS.select do |_,v|
        v == @direction
      end.keys.first
    end
  end
end
