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
    #main_menu

    #тестовые объекты
    @stations << Station.new('Minsk')
    @stations << Station.new('Brest')
    @stations << Station.new('Gomel')
    @stations << Station.new('Grodno')

    @trains << CargoTrain.new(1000)
    @trains << PassengerTrain.new(1010)

    @routes << Route.new(@stations[0], @stations[1])
    @routes << Route.new(@stations[2], @stations[3])
  end

#ГЛАВНОЕ МЕНЮ
  def main_menu
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
    puts ''
    puts 'Просмотреть:'
    puts '1 - Станции'
    puts '2 - Поезда'
    puts '3 - Маршруты'
    print 'Ваш выбор: '

  input = gets.to_i

  case input
    when 1
      menu_stations
    when 2
      menu_trains
    when 3
      menu_routes
    else
      puts "Не верный ввод!"
      main_menu
  end
  end  

#УПРАВЛЕНИЕ СТАНЦИЯМИ
  def menu_stations
    puts '--------------------'
    puts '----- СТАНЦИИ ------'
    puts '--------------------'
    puts '1 - создать станцию'
    puts '2 - вывести список станций'
    puts '0 - главное меню'
    print 'Ваш выбор: '

    input = gets.to_i

    case input
    when 1
      print 'Введите название станции: '
      title = gets.chomp
      @stations << Station.new(title)
      puts "Создана станция '#{title}'"
      menu_stations
    when 2
      puts '*** Список станций ***'
      unless @stations.empty?
        @stations.each_with_index { |station, index| puts "[#{index}] --> Станция: #{station.title}. Поезда на станции: #{station.trains}" }
      else
        puts 'Список станций пуст!'
      end
      menu_stations
    when 0
      main_menu
    else
      puts "Не верный ввод!"
      menu_stations
    end
  end

#УПРАВЛЕНИЕ ПОЕЗДАМИ
  def menu_trains
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

    input = gets.to_i

    case input
    when 1
      print 'Введите номер поезда:'
      number = gets.chomp
      print 'Введите тип поезда(1 - для грузового, 2 - для пассажирского): '
      input = gets.to_i
      
      case input
      when 1
        @trains << CargoTrain.new(number)
      when 2
        @trains << PassengerTrain.new(number)
      else
        puts "Не верный ввод!"
        menu_trains    
      end

      puts "Создан поезд № #{number}"
      menu_trains
    when 2
      puts '*** Список поездов ***'
      unless @trains.empty?
        @trains.each_with_index { |train, index| puts "[#{index}] --> поезд № #{train.number}, вагонов: #{train.carriages.size}" }
      else
        puts 'Список поездов пуст!'
      end
      menu_trains
    when 3
      @trains.each_with_index { |train, index| puts "[#{index}] --> поезд № #{train.number}, вагонов: #{train.carriages.size}" }
      print 'Введите ИНДЕКС поезда к которому необходимо прицепить вагон: '
      input_train = gets.to_i
      train = @trains[input_train]

      if train.class == PassengerTrain
       carriage = PassengerCarriage.new
      else
        carriage = CargoCarriage.new
      end

      train.add_carriage(carriage)
      puts "Добавлен вагон к поезду № #{train.number}. Вагонов у поезда: #{train.carriages.size}"
      menu_trains
    when 4
      @trains.each_with_index { |train, index| puts "[#{index}] --> поезд № #{train.number}, вагонов: #{train.carriages.size}" }
      print 'Введите ИНДЕКС поезда от которого необходимо отцепить вагон: '
      input_train = gets.to_i
      train = @trains[input_train]

      train.remove_carriage
      puts "Отцеплен вагон от поезда № #{train.number}. Вагонов у поезда: #{train.carriages.size}"
      menu_trains
    when 5
      @trains.each_with_index { |train, index| puts "[#{index}] --> поезд № #{train.number}" }
      print 'Введите ИНДЕКС поезда, которому будет назначен маршрут: '
      input_train = gets.to_i
      train = @trains[input_train]

      @routes.each_with_index { |route, index| puts "[#{index}] --> Маршрут '#{route.stations.first.title} - #{route.stations.last.title}" }
      print 'Введите ИНДЕКС маршрута, который будет назначен: '
      input_route = gets.to_i
      route = @routes[input_route]

      puts "Маршрут '#{route.stations.first.title} - #{route.stations.last.title}' назначен поезду № #{train.number}"
      menu_trains
    when 6
      @trains.each_with_index { |train, index| puts "[#{index}] --> поезд № #{train.number}, текущая станция: #{train.сurrent_station}" }
      print 'Введите ИНДЕКС поезда, который необходимо перемесить вперед по маршруту: '
      input_train = gets.to_i
      train = @trains[input_train]
      train.forward
      puts "Поезд перемещен вперед. Текущая станция: #{train.current_station}"
    when 7
      @trains.each_with_index { |train, index| puts "[#{index}] --> поезд № #{train.number}, текущая станция: #{train.сurrent_station}" }
      print 'Введите ИНДЕКС поезда, который необходимо перемесить назад по маршруту: '
      input_train = gets.to_i
      train = @trains[input_train]
      train.back
      puts "Поезд перемещен назад. Текущая станция: #{train.current_station}"
      menu_trains
    when 0
      main_menu
    else
      puts "Не верный ввод!"
    end
  end

#УПРАВЛЕНИЕ МАРШРУТАМИ
  def menu_routes
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

    input = gets.to_i

    case input
    when 1
      #create_train
    when 2
      puts '*** Список маршрутов ***'
      unless @routes.empty?
        @routes.each_with_index { |route, index| puts "[#{index}] --> #{route.stations.first.title} - #{route.stations.last.title}" }
      else
        puts 'Список маршрутов пуст!'
      end
      menu_routes
    when 3
      #main_menu
    when 4
      #main_menu
    when 5
      #main_menu
    when 0
      main_menu
    else
      puts "Не верный ввод!"
    end
  end
end



