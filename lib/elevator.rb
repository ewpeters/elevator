class Elevator
  attr_accessor :number_for_floors, :current_floor, :floor_queue
  def initialize(number_of_floors)
    @number_of_floors = number_of_floors
    @floor_queue = []
    @current_floor = 1

    (0..@number_of_floors).each do |floor_number|
      (class << self; self; end).class_eval do
        define_method("floor_#{floor_number}".to_sym) { floor_button(floor_number) }
        define_method("floor_#{floor_number}_up".to_sym) { call_elevator(floor_number) }
        define_method("floor_#{floor_number}_down".to_sym) { call_elevator(floor_number) }
      end
    end
  end

  private
  def floor_button(floor)
    @floor_queue << floor
    proccess_queue
  end

  def call_elevator(floor)
    @floor_queue << floor
    proccess_queue
  end

  def proccess_queue
    @current_floor = travel_to_floor(@floor_queue.shift)
    return @current_floor
  end

  def travel_to_floor(floor_number)
    # do something to make elevator actually move?
    return floor_number
  end
end
