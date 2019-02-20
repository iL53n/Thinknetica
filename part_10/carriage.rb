require_relative './manufacturer.rb'
require_relative './accessors'

class Carriage
  include Manufacturer
  extend Accessors

  EMPTY_CAPACITY_ERROR = 'ERROR! Укажите объем(м3 или места)!'.freeze
  NO_FREE_CAPACITY = 'ВНИМАНИЕ! Не хватает свободного объема или места!'.freeze

  attr_accessors_with_history :type, :capacity

  def initialize(capacity, type)
    @capacity = capacity
    @type = type
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
