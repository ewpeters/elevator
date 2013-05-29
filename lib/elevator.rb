class Elevator
  attr_accessor :number_for_floors, :current_floor
  def initialize(number_of_floors)
    @number_of_floors = number_of_floors

    (0..@number_of_floors).each do |floor_number|
      (class << self; self; end).class_eval do
        define_method("floor_#{floor_number}".to_sym) { go_to_floor(floor_number) }
        define_method("floor_#{floor_number}_up".to_sym) { call_elevator(floor_number) }
        define_method("floor_#{floor_number}_down".to_sym) { call_elevator(floor_number) }
      end
    end
  end

  private
  def go_to_floor(floor)
    @current_floor = floor
    return @current_floor
  end

  def call_elevator(floor)
    @current_floor = floor
    return @current_floor
  end
end
