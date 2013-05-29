require 'spec_helper'

describe Elevator do
  it "should have a button for each floor" do
    num_floors = rand(100)

    elevator = Elevator.new(num_floors)

    (0..num_floors).each do |number|
      elevator.should respond_to("floor_#{number}".to_sym)
    end
  end

  it "should set the current floor to x when floor_x is called" do
    elevator = Elevator.new(100)
    elevator.floor_20

    elevator.current_floor.should == 20
  end
end
