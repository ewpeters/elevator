require 'spec_helper'

describe Elevator do
  it "should be able to travel to a higher floor from a lower floor" do
    elevator = Elevator.new(100)
    elevator.floor_20

    elevator.move(20)
    elevator.current_floor.should == 20
  end

  it "should be able to travel to a lower floor from a higher floor" do
    elevator = Elevator.new(100)
    elevator.current_floor = 100

    elevator.floor_40

    elevator.move(60)
    elevator.current_floor.should == 40
  end

  it "should be able to be called from a lower floor to a higher floor" do
    elevator = Elevator.new(100)
    elevator.floor_20_down

    elevator.move(80)
    elevator.current_floor.should == 20
  end

  it "should be able to be called from a higher floor to a lower floor" do
    elevator = Elevator.new(100)
    elevator.current_floor = 100
    elevator.floor_20_down


    elevator.move(80)
    elevator.current_floor.should == 20
  end

  it "should travel to floors in order if the floor buttons are pressed out of order" do
    elevator = Elevator.new(100)

    elevator.floor_40
    elevator.floor_30
    elevator.floor_20

    elevator.move(20)
    elevator.current_floor.should == 20
    elevator.move(10)
    elevator.current_floor.should == 30
    elevator.move(10)
    elevator.current_floor.should == 40
  end

  it "should not enqueue a floor more than once" do
    elevator = Elevator.new(100)

    elevator.floor_20
    elevator.floor_20
    elevator.floor_20
    elevator.floor_20

    elevator.up_queue.should == [20]
  end

  it "should travel to floors below the current if traveling up after all the floors have been traveled to" do
    elevator = Elevator.new(100)

    elevator.floor_30
    elevator.floor_40

    elevator.move(30)
    elevator.floor_5

    elevator.move(10)
    elevator.current_floor.should == 40

    elevator.move(45)
    elevator.current_floor.should == 5
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

  it "should have a button for each floor" do
    num_floors = rand(100)

    elevator = Elevator.new(num_floors)

    (0..num_floors).each do |number|
      elevator.should respond_to("floor_#{number}".to_sym)
    end
  end
end
