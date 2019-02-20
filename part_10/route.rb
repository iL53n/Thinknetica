require_relative './instance_counter.rb'
require_relative './validation.rb'
require_relative './accessors.rb'

class Route
  include InstanceCounter
  include Validation
  extend Accessors

  attr_accessors_with_history :stations

  def initialize(start_station, finish_station)
    @stations = [start_station, finish_station]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    return if [@stations.first, @stations.last].include?(station)

    @stations.delete(station)
  end
end
