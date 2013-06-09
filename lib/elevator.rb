class Elevator
  attr_accessor :number_for_floors, :current_floor, :target_floor, :direction

  attr_accessor :up_queue, :down_queue
  def initialize(number_of_floors)
    @number_of_floors = number_of_floors
    @up_queue = []
    @down_queue = []
    @current_floor = 1

    (0..@number_of_floors).each do |floor_number|
      (class << self; self; end).class_eval do
        define_method("floor_#{floor_number}".to_sym) { floor_button(floor_number) }
        define_method("floor_#{floor_number}_up".to_sym) { call_elevator(floor_number) }
        define_method("floor_#{floor_number}_down".to_sym) { call_elevator(floor_number) }
      end
    end
  end

  def move(amount_to_move)
    if @direction == -1
      queue = @down_queue
    else
      queue = @up_queue
    end

    if queue.empty?
      @direction = @direction * -1

      queue = queue.eql?(@down_queue) ? @up_queue : @down_queue
    end

    @target_floor = queue.shift

    amount_to_move.times do
      unless @current_floor == target_floor
        @current_floor += @direction
      end
    end
  end

  private
  def floor_button(floor)
    if floor > @current_floor
      @up_queue << floor unless @up_queue.include?(floor)
      @up_queue.sort!
      @direction = 1 unless @direction
    else
      @down_queue << floor unless @down_queue.include?(floor)
      @down_queue.sort!
      @direction = -1 unless @direction
    end
  end

  def call_elevator(floor)
    floor_button(floor)
  end
end
