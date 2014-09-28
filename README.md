# ToyRobot

- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction.
  Any movement that would result in the robot falling from the table must be prevented, however further valid movement
  commands must still be allowed.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.

```

      -----------------------------
     |     |     |     |     |     |
     |     |     |     |     |     |       N
      -----------------------------      W   E
     |     |     |     |     |     |       S
     |     |     |     |     |     |
      -----------------------------
     |     |     |     |     |     |
     |     |     |     |     |     |
      -----------------------------
     |     |     |     |     |     |
     |     |     |     |     |     |
      -----------------------------
     |     |     |     |     |     |
     |     |     |     |     |     |
      -----------------------------
(0,0)

```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'toy_robot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install toy_robot

## Usage

Commands are of the following form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```


### Example Input and Output:
```
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
```

```
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```

```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```