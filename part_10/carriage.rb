require_relative './manufacturer.rb'
<<<<<<< HEAD
require_relative './accessors'

class Carriage
  include Manufacturer
  extend Accessors
=======

class Carriage
  include Manufacturer
>>>>>>> 1e0905092aac27c087aa93f294c9e941b33ce845

  EMPTY_CAPACITY_ERROR = 'ERROR! Укажите объем(м3 или места)!'.freeze
  NO_FREE_CAPACITY = 'ВНИМАНИЕ! Не хватает свободного объема или места!'.freeze

<<<<<<< HEAD
  attr_accessors_with_history :type, :capacity
=======
  attr_reader :type, :capacity
>>>>>>> 1e0905092aac27c087aa93f294c9e941b33ce845

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
