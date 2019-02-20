require_relative './instance_counter.rb'
require_relative './validation.rb'
require_relative './accessors.rb'

class Station
  include InstanceCounter
  include Validation
  extend Accessors

  attr_accessors_with_history :title, :trains

  validate :title, :presence
  validate :title, :length

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(title)
    @title = title
    @trains = []
    @@stations << self
    register_instance
    validate!
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def each_train
    @trains.each { |train| yield(train) }
  end
end
