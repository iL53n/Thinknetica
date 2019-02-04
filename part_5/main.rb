=begin
- Создавать станции

- Создавать поезда

- Создавать маршруты и управлять станциями в нем (добавлять, удалять)

- Назначать маршрут поезду

- Добавлять вагоны к поезду

- Отцеплять вагоны от поезда

- Перемещать поезд по маршруту вперед и назад

- Просматривать список станций и список поездов на станции

В качестве ответа приложить ссылку на репозиторий с решением
=end

require_relative "./station.rb"   
require_relative "./route.rb"  
require_relative "./train.rb"
require_relative "./carriage.rb"
require_relative "./passenger_carriage.rb" 
require_relative "./passenger_train.rb" 
require_relative "./cargo_carriage.rb"
require_relative "./cargo_train.rb"

class Railway

  def initialize
    @stations = []
    @trains = []
    @routes = []
    logo
    main_menu
    
    #тестовые объекты
    # @stations << Station.new('Minsk')
    # @stations << Station.new('Brest')
    # @stations << Station.new('Gomel')
    # @stations << Station.new('Grodno')
    # @trains << CargoTrain.new(1000)
    # train1 = PassengerTrain.new(1010)
    # @trains << train1
    # @routes << Route.new(@stations[0], @stations[1])
    # route1 = Route.new(@stations[2], @stations[3])
    # @routes << route1
    # train1.set_route(route1)    
  end

#ГЛАВНОЕ МЕНЮ
  def main_menu
    loop do
      main_menu_view
      case gets.to_i
      when 1 then menu_stations
      when 2 then menu_trains
      when 3 then menu_routes
      when 0 then exit
      else puts INVALID_INDEX
      end
    end
  end

#УПРАВЛЕНИЕ СТАНЦИЯМИ
  def menu_stations
    loop do
      menu_stations_view
      case gets.to_i
      when 1 then create_station
      when 2 then stations_list
      when 0 then break
      else puts INVALID_INDEX
      end
    end
  end

#УПРАВЛЕНИЕ ПОЕЗДАМИ
  def menu_trains
    loop do
      menu_trains_view
      case gets.to_i
      when 1 then create_train
      when 2 then trains_list
      when 3 then add_carriage_to_train
      when 4 then remove_carriage_from_train        
      when 5 then set_route_to_train
      when 6 then forward_train
      when 7 then back_train       
      when 0 then break
      else puts INVALID_INDEX
      end
    end
  end

#УПРАВЛЕНИЕ МАРШРУТАМИ
  def menu_routes
    loop do
      menu_routes_view
      case gets.to_i
      when 1 then create_route        
      when 2 then routes_list
      when 3 then add_station_to_route
      when 4 then del_station_from_route      
      when 5 then set_route_to_train
      when 0 then break
      else puts INVALID_INDEX
      end
    end
  end

private
  INVALID_INDEX = 'ERROR! Не верный ввод!'

  def select_from_array(array)
    index = gets.to_i
    array[index - 1]
  end

#СТАНЦИИ_МЕТОДЫ
  def create_station
    print 'Введите название станции: '
    title = gets.chomp.capitalize
    @stations << Station.new(title)
    puts "Создана станция '#{title}'"
  end

  def stations_list
    puts '*** Список станций ***'
    return puts('Список станций пуст!') if @stations.empty?
    @stations.each.with_index(1) do |station, index|
       train_numbers = station.trains.map(&:number).join(', ')
       puts "[#{index}] --> #{station.title}, поезд(а) на станции №: #{train_numbers}"
    end
  end

#ПОЕЗДА_МЕТОДЫ
  def create_train
    print 'Введите номер нового поезда:'
    number = gets.chomp  

    print 'Введите тип поезда(1 - для грузового, 2 - для пассажирского): '
    case gets.to_i
    when 1 then @trains << CargoTrain.new(number)
      puts "Создан грузовой поезд № #{number}"
    when 2 then @trains << PassengerTrain.new(number)
      puts "Создан пассажирский поезд № #{number}"
    else puts INVALID_INDEX 
    end
  end

  def trains_list
    puts '*** Список поездов ***'
    return puts 'Список поездов пуст!' if @stations.empty?
    @trains.each.with_index(1) do |train, index|
      puts "[#{index}] --> поезд № #{train.number}, вагонов: #{train.carriages.size}"
    end
  end

  def add_carriage_to_train
    trains_list
    print 'Введите ИНДЕКС поезда к которому необходимо прицепить вагон: '
    train = select_from_array(@trains)
    return puts(INVALID_INDEX) if train.nil?

    if train.is_a?(PassengerTrain)
      carriage = PassengerCarriage.new
    else
      carriage = CargoCarriage.new
    end

    train.add_carriage(carriage)
    puts "Добавлен вагон к поезду № #{train.number}. Теперь вагонов у поезда: #{train.carriages.size}"
  end

  def remove_carriage_from_train
    trains_list
    print 'Введите ИНДЕКС поезда от которого необходимо отцепить вагон: '
    train = select_from_array(@trains)
    return puts(INVALID_INDEX) if train.nil?

    train.remove_carriage
    puts "Отцеплен вагон от поезда № #{train.number}. Вагонов у поезда: #{train.carriages.size}"
  end

  def set_route_to_train
    trains_list
    print 'Введите ИНДЕКС поезда, которому будет назначен маршрут: '
    train = select_from_array(@trains)
    return puts(INVALID_INDEX) if train.nil?

    routes_list
    print 'Введите ИНДЕКС маршрута, который будет назначен: '
    route = select_from_array(@routes)
    return puts(INVALID_INDEX) if route.nil?

    train.set_route(route)

    puts "Маршрут '#{route.stations.map(&:title).join('-')}' назначен поезду № #{train.number}"
  end

  def forward_train
    trains_list
    print 'Введите ИНДЕКС поезда, который необходимо перемесить вперед по маршруту: '
    train = select_from_array(@trains)
    return puts(INVALID_INDEX) if train.nil?
    train.forward
    puts "Поезд перемещен вперед. Текущая станция: #{train.current_station.title}"
  end

  def back_train
    trains_list
    print 'Введите ИНДЕКС поезда, который необходимо перемесить назад по маршруту: '
    train = select_from_array(@trains)
    return puts(INVALID_INDEX) if train.nil?
    train.back
    puts "Поезд перемещен назад. Текущая станция: #{train.current_station.title}"
  end

#МАРШРУТЫ_МЕТОДЫ
  def create_route
    stations_list
    print "Введите индекс начальной станции: "
    start_station = select_from_array(@stations)
    return puts(INVALID_INDEX) if start_station.nil?
    print "Введите индекс конечной станции: "
    finish_station = select_from_array(@stations)
    return puts(INVALID_INDEX) if finish_station.nil?

    @routes << Route.new(start_station, finish_station)

    puts "Создан маршрут '#{start_station.title} - #{finish_station.title}'"
  end

  def routes_list
    puts '*** Список маршрутов ***'
    return puts 'Список маршрутов пуст!' if @routes.empty?
      @routes.each.with_index(1) do |route, index| 
      puts "[#{index}] --> #{route.stations.map(&:title).join('-')}"
    end
  end

  def add_station_to_route
    routes_list
    print "Введите индекс маршрута, в который будет добавлена станция: "
    route = select_from_array(@routes)
    return puts(INVALID_INDEX) if route.nil?
    stations_list
    print "Введите индекс станции, которую необходимо добавить в маршрут: "
    station = select_from_array(@stations)
    return puts(INVALID_INDEX) if station.nil?
    
    if route.stations.include?(station)
      puts INVALID_INDEX
      puts "Станция '#{station.title}' уже есть в маршруте."
    else
      route.add_station(station)
      puts "Станция '#{station.title}' добавлена!"
    end
  end

  def del_station_from_route
    routes_list
    print "Введите индекс маршрута, из которого необходимо удалить станцию: "
    route = select_from_array(@routes)
    return puts(INVALID_INDEX) if route.nil?
    stations_list
    print "Введите индекс станции, которую необходимо удалить из маршрута: "
    station = select_from_array(@stations)
    return puts(INVALID_INDEX) if station.nil?
   
    if route.stations.include?(station)
      route.del_station(station)
      puts "Станция '#{station.title}' удалена из маршрута!"
    else
      puts INVALID_INDEX
      puts "Станции '#{station.title}' нет в маршруте!"
    end
  end

#МЕНЮ_лого, текст
  def logo
    puts '-------------------------------------------'
    puts '╔════╦╗╔╦══╦╗─╔╦╗╔══╦╗─╔╦═══╦════╦══╦══╦══╗'
    puts '╚═╗╔═╣║║╠╗╔╣╚═╝║║║╔═╣╚═╝║╔══╩═╗╔═╩╗╔╣╔═╣╔╗║'
    puts '──║║─║╚╝║║║║╔╗─║╚╝║─║╔╗─║╚══╗─║║──║║║║─║╚╝║'
    puts '──║║─║╔╗║║║║║╚╗║╔╗║─║║╚╗║╔══╝─║║──║║║║─║╔╗║'
    puts '──║║─║║║╠╝╚╣║─║║║║╚═╣║─║║╚══╗─║║─╔╝╚╣╚═╣║║║'
    puts '──╚╝─╚╝╚╩══╩╝─╚╩╝╚══╩╝─╚╩═══╝─╚╝─╚══╩══╩╝╚╝'
    puts '─────────╔═══╦══╦══╦╗─╔╗╔╗╔╦══╦╗╔╗─────────'
    puts '─╔╗─╔╗─╔╗║╔═╗║╔╗╠╗╔╣║─║║║║║║╔╗║║║║╔╗─╔╗─╔╗─'
    puts '╔╝╚╦╝╚╦╝╚╣╚═╝║╚╝║║║║║─║║║║║║╚╝║╚╝╠╝╚╦╝╚╦╝╚╗'
    puts '╚╗╔╩╗╔╩╗╔╣╔╗╔╣╔╗║║║║║─║║║║║║╔╗╠═╗╠╗╔╩╗╔╩╗╔╝'
    puts '─╚╝─╚╝─╚╝║║║║║║║╠╝╚╣╚═╣╚╝╚╝║║║║╔╝║╚╝─╚╝─╚╝─'
    puts '─────────╚╝╚╝╚╝╚╩══╩══╩═╝╚═╩╝╚╝╚═╝─────────'
    puts '-------------------------------------------'
  end

  def main_menu_view
    puts '--------------------'
    puts '--- ГЛАВНОЕ МЕНЮ ---'
    puts '--------------------'
    puts 'Просмотреть:'
    puts '1 - Станции'
    puts '2 - Поезда'
    puts '3 - Маршруты'
    puts '0 - Выйти'
    print 'Ваш выбор: '
  end

  def menu_stations_view
    puts '--------------------'
    puts '----- СТАНЦИИ ------'
    puts '--------------------'
    puts '1 - создать станцию'
    puts '2 - вывести список станций'
    puts '0 - главное меню'
    print 'Ваш выбор: '
  end

  def menu_trains_view
    puts '--------------------'
    puts '----- ПОЕЗДА -------'
    puts '--------------------'
    puts '1 - создать поезд'
    puts '2 - вывести список поездов'
    puts '3 - добавить вагон к поезду'
    puts '4 - отцепить вагон от поезда'
    puts '5 - назначить маршрут поезду'
    puts '6 - переместить поезд вперед по маршруту'
    puts '7 - переместить поезд назад по маршруту'
    puts '0 - главное меню'
    print 'Ваш выбор: '
  end

  def menu_routes_view
    puts '--------------------'
    puts '----- МАРШРУТЫ -----'
    puts '--------------------'
    puts '1 - создать маршрут'
    puts '2 - вывести список маршрутов'
    puts '3 - добавить станцию в маршрут'
    puts '4 - удалить станцию из маршрута'
    puts '5 - назначить маршрут поезду'
    puts '0 - главное меню'
    print 'Ваш выбор: '
  end
end
