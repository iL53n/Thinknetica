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
    main_menu_view
    input = gets.to_i

    case input
    when 1
      menu_stations
    when 2
      menu_trains
    when 3
      menu_routes
    when 0
      exit
    else
      puts "Не верный ввод!"
      main_menu
    end
  end

#УПРАВЛЕНИЕ СТАНЦИЯМИ
  def menu_stations
    menu_stations_view
    input = gets.to_i

    case input
    when 1
      print 'Введите название станции: '
      title = gets.chomp.capitalize
      @stations << Station.new(title)
      puts "Создана станция '#{title}'"
      menu_stations
    when 2
      stations_list
      menu_stations
    when 0
      main_menu
    else
      puts "Не верный ввод!"
      menu_stations
      return false
    end
  end

#УПРАВЛЕНИЕ ПОЕЗДАМИ
  def menu_trains
    menu_trains_view
    input = gets.to_i

    case input
    when 1
      print 'Введите номер нового поезда:'
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
      trains_list
      menu_trains
    when 3
      trains_list
      print 'Введите ИНДЕКС поезда к которому необходимо прицепить вагон: '
      input_train = gets.to_i
      train = @trains[input_train]

      if train.class == PassengerTrain
       carriage = PassengerCarriage.new
      else
        carriage = CargoCarriage.new
      end

      train.add_carriage(carriage)
      puts "Добавлен вагон к поезду № #{train.number}. Теперь вагонов у поезда: #{train.carriages.size}"
      menu_trains
    when 4
      trains_list
      print 'Введите ИНДЕКС поезда от которого необходимо отцепить вагон: '
      input_train = gets.to_i
      train = @trains[input_train]

      train.remove_carriage
      puts "Отцеплен вагон от поезда № #{train.number}. Вагонов у поезда: #{train.carriages.size}"
      menu_trains
    when 5
      trains_list
      print 'Введите ИНДЕКС поезда, которому будет назначен маршрут: '
      input_train = gets.to_i
      train = @trains[input_train]

      routes_list
      print 'Введите ИНДЕКС маршрута, который будет назначен: '
      input_route = gets.to_i
      route = @routes[input_route]

      train.set_route(route)

      puts "Маршрут '#{route.stations.map(&:title).join('-')}' назначен поезду № #{train.number}"
      menu_trains
    when 6
      trains_list
      print 'Введите ИНДЕКС поезда, который необходимо перемесить вперед по маршруту: '
      input_train = gets.to_i
      train = @trains[input_train]
      train.forward
      puts "Поезд перемещен вперед. Текущая станция: #{train.current_station.title}"
      menu_trains
    when 7
      trains_list
      print 'Введите ИНДЕКС поезда, который необходимо перемесить назад по маршруту: '
      input_train = gets.to_i
      train = @trains[input_train]
      train.back
      puts "Поезд перемещен назад. Текущая станция: #{train.current_station.title}"
      menu_trains
    when 0
      main_menu
    else
      puts "Не верный ввод!"
      menu_trains
    end
  end

#УПРАВЛЕНИЕ МАРШРУТАМИ
  def menu_routes
    menu_routes_view
    input = gets.to_i

    case input
    when 1
      stations_list

      print "Введите индекс начальной станции: "
      index_start = gets.to_i
      print "Введите индекс конечной станции: "
      index_finish = gets.to_i

      @routes << Route.new(@stations[index_start], @stations[index_finish])

      puts "Создан маршрут '#{@stations[index_start].title} - #{@stations[index_finish].title}'"
      menu_routes
    when 2
      routes_list
      menu_routes
    when 3
      routes_list
      print "Введите индекс маршрута, в который будет добавлена станция: "
      index_route = gets.to_i
      stations_list
      print "Введите индекс станции, которую необходимо добавить в маршрут: "
      index_station = gets.to_i
      
      @routes[index_route].add_station(@stations[index_station])  #нет проверки на повтор

      puts "Станция '#{@stations[index_station].title}' добавлена!"
      menu_routes
    when 4
      routes_list
      print "Введите индекс маршрута, из которого необходимо удалить станцию: "
      index_route = gets.to_i
      stations_list
      print "Введите индекс станции, которую необходимо удалить из маршрута: "
      index_station = gets.to_i

      @routes[index_route].del_station(@stations[index_station])
      puts "Станция '#{@stations[index_station].title}' удалена из маршрута!"
      menu_routes
    when 5
      trains_list
      print 'Введите ИНДЕКС поезда, которому будет назначен маршрут: '
      input_train = gets.to_i
      train = @trains[input_train]

      routes_list
      print 'Введите ИНДЕКС маршрута, который будет назначен: '
      input_route = gets.to_i
      route = @routes[input_route]

      train.set_route(route)

      puts "Маршрут '#{route.stations.map(&:title).join('-')}' назначен поезду № #{train.number}"
      menu_trains
    when 0
      main_menu
    else
      puts "Не верный ввод!"
    end
  end

private
  def stations_list
    puts '*** Список станций ***'
    unless @stations.empty?
      @stations.each_with_index { |station, index| puts "[#{index}] --> #{station.title}, поезд(а) на станции №: #{station.trains.map(&:number).join(', ')}" }   
    else
      puts 'Список станций пуст!'
    end
  end

  def trains_list
    puts '*** Список поездов ***'
    unless @trains.empty?
      @trains.each_with_index { |train, index| puts "[#{index}] --> поезд № #{train.number}, вагонов: #{train.carriages.size}" }
    else
      puts 'Список поездов пуст!'
    end
  end

  def routes_list
    puts '*** Список маршрутов ***'
    unless @routes.empty?
      @routes.each_with_index { |route, index| puts "[#{index}] --> #{route.stations.map(&:title).join('-')}" }
    else
      puts 'Список маршрутов пуст!'
    end
  end

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
