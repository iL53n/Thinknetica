=begin
**Класс Route (Маршрут):**

- Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута,
- а промежуточные могут добавляться между ними.
- Может добавлять промежуточную станцию в список
- Может удалять промежуточную станцию из списка
- Может выводить список всех станций по-порядку от начальной до конечной
=end

class Route
  attr_reader :stations

  def initialize(start_station, finish_station)
    @stations = [start_station, finish_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station) if station != @stations.first || @stations.last
  end

  def show_stations
    @stations.each { |station| puts station }
  end
end
