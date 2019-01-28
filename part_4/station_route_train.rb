=begin
**Класс Station (Станция):**

- Имеет название, которое указывается при ее создании
- Может принимать поезда (по одному за раз)
- Может возвращать список всех поездов на станции, находящиеся в текущий момент
- Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
- Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
=end

class Station
  attr_reader :title, :trains

  def initialize (title)
    @title = title
    puts "Создана станция: #{title}"
    @trains = []
  end

  def train_add (train)
    @trains << train
    puts "Добавлен поезд №#{train.number}"
  end

  def trains_show
    @trains.each { |train| puts "Поезд №#{train.number}" } #добавить вывод кол-ва по типу
  end

  def trains_type
    @trains.each { |train| puts "Поезд №#{train.number} тип: #{train.type}"}
  end

  def train_send (train)
    @trains.delete(train)
    puts "Поезд №#{train.number} отправлен со станции."
  end
end

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

  def initialize (start_station, finish_station)
    @stations = [start_station, finish_station]
  end

  def station_add (station)
    @stations.insert(1, station)
    puts "Добавлена станция: #{station.title}"
  end

  def station_del (station) #или по поз?
    @stations.delete(station)
    puts "Удалена станция: #{station.title}"
  end

  def stations_all
    @stations.each { |station| puts "Станция: #{station.title}" }
  end
end

=begin
**Класс Train (Поезд):**

- Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
- Может набирать скорость
- Может возвращать текущую скорость
- Может тормозить (сбрасывать скорость до нуля)
- Может возвращать количество вагонов
- Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
- Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
- Может принимать маршрут следования (объект класса Route).
- При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
- Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
- Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end

class Train
  attr_accessor :speed, :carriages, :route
  attr_reader :number, :type, :stations

  def initialize (number, type, carriages) #type = cargo || passenger
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def speed_up (speed)
    self.speed += speed
  end

  def stop
    if speed == 0 #speed.zero? -- проверить по гайду, что лучше
      puts "Поезд уже остановлен!"
    else
      self.speed = 0
    end
  end

  def carriage_plus
    if speed == 0
      self.carriages += 1
    else
      puts "Чтобы прицепить вагон, необходимо остановить поезд!"
    end
  end

  def carriage_minus
    if speed == 0
      self.carriages -= 1
    else
      puts "Чтобы отцепить вагон, необходимо остановить поезд!"
    end
  end
end



