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
  attr_reader :speed, :carriages, :route, :number, :type, :current_station

  def initialize(number, type, carriages) #type = cargo || passenger
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def up_speed(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @carriages += 1 if speed.zero?
  end

  def remove_carriage
    return unless speed.zero? && carriages.positive?
    @carriages -= 1
  end

  def set_route(route)
    @route = route
    @current_station = 0
    current_station.add_train(self) #на станцию начальную[0] добавляем текущий объект
  end

  def current_station
    route.stations[@current_station] #возвращает станцию на позиции @current_station
  end

  def prev_station
    route.stations[@current_station - 1] #возвращает станцию на позиции @current_station - 1
  end  

  def next_station
    route.stations[@current_station + 1] #возвращает станцию на позиции @current_station + 1
  end 

  def forward
    current_station.send_train(self)
    next_station.add_train(self)
    @current_station += 1
  end

  def back
    current_station.send_train(self)
    prev_station.add_train(self)
    @current_station -= 1
  end
end

