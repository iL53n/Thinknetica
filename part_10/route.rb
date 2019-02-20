require_relative './instance_counter.rb'
require_relative './validation.rb'
<<<<<<< HEAD
require_relative './accessors'
=======
>>>>>>> 1e0905092aac27c087aa93f294c9e941b33ce845

class Route
  include InstanceCounter
  include Validation
<<<<<<< HEAD
  extend Accessors

  attr_accessors_with_history :stations
=======

  attr_reader :stations
>>>>>>> 1e0905092aac27c087aa93f294c9e941b33ce845

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
