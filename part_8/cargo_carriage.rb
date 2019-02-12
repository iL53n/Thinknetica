class CargoCarriage < Carriage

  EMPTY_CAPACITY_ERROR = 'ERROR! Укажите объем вагона!' 
  NO_FREE_CAPACITY = 'ВНИМАНИЕ! Не хватает свободного объема!'

  attr_reader :capacity

  def initialize(capacity)
    @type = 'cargo'
    @capacity = capacity
    @available_capacity = capacity
    validate!
  end

  def take_capacity(size)
    raise NO_FREE_CAPACITY if size > @available_capacity
    @available_capacity -= size
  end

  def available_capacity
    @available_capacity
  end

  def occupied_capacity
    @capacity - @available_capacity
  end

  protected

  def validate!
    raise EMPTY_CAPACITY_ERROR if capacity.nil?
  end
end
