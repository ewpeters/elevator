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

  it "should go to floor x when floor_x_up is called" do
    elevator = Elevator.new(100)
    elevator.floor_20_up

    elevator.current_floor.should == 20
  end

  it "should go to floor x when floor_x_down is called" do
    elevator = Elevator.new(100)
    elevator.floor_20_down

    elevator.current_floor.should == 20
  end

  it "should have an up button for each floor" do
    num_floors = rand(100)

    elevator = Elevator.new(num_floors)

    (0..num_floors).each do |number|
      elevator.should respond_to("floor_#{number}_up".to_sym)
    end
  end

  it "should have a down button for each floor" do
    num_floors = rand(100)

    elevator = Elevator.new(num_floors)

    (0..num_floors).each do |number|
      elevator.should respond_to("floor_#{number}_down".to_sym)
    end
  end
end
