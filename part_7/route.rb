require_relative "./instance_counter.rb"
require_relative "./valid.rb"

class Route
  include InstanceCounter
  include Valid

  attr_reader :stations

  def initialize(start_station, finish_station)
    @stations = [start_station, finish_station]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    #@stations.delete(station) if station != @stations.first && station != @stations.last
    return if [@stations.first, @stations.last].include?(station)
    @stations.delete(station)
  end

  def show_stations
    @stations.each { |station| puts station.title }
  end
end
