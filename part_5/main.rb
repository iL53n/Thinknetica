require_relative "./station.rb"   
require_relative "./route.rb"  
require_relative "./train.rb"
require_relative "./carriage.rb"
require_relative "./passenger_carriage.rb" 
require_relative "./passenger_train.rb" 
require_relative "./cargo_carriage.rb"
require_relative "./cargo_train.rb"


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
puts '4 - Вагоны'
print 'Ваш выбор: '

=begin  доделать, подумать о логике интерфейса, 



input = gets.to_i

case input
  when 1
    stations_list
  when 2
   puts "2" 
end


ДУБЛИРОВАНИЕ

private
def stations_list
  stations = ObjectSpace.each_object(Station).to_a
  stations.each {|station| puts "#{station.title} - #{station.trains}"}
end

def train_list
  stations = ObjectSpace.each_object(Station).to_a
  stations.each {|train| puts "#{train.number} - #{train.type}"}
end

def route_list
  stations = ObjectSpace.each_object(Station).to_a
  stations.each {|route| puts "#{route.start_station.title} - #{route.finish_station.title}"}
end

def carriages_list
  stations = ObjectSpace.each_object(Station).to_a
  stations.each {|carriage| puts "#{carriage.type} - #{i.trains}"}
end



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
