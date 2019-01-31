
require_relative "./station.rb"   
require_relative "./route.rb"  
require_relative "./train.rb"
require_relative "./carriage.rb"
require_relative "./passenger_carriage.rb" 
require_relative "./passenger_train.rb" 
require_relative "./cargo_carriage.rb"
require_relative "./cargo_train.rb"   

#puts "Станции_создание"
station1 = Station.new('Minsk')
station2 = Station.new('Brest')
station3 = Station.new('Gomel')

#puts "Созадем вагоны"
cargo1 = CargoCarriage.new
passenger1 = PassengerCarriage.new

#puts "Поезда"
train1 = CargoTrain.new(1000)
train1.speed_up(30)
train1.stop
train1.add_carriage(cargo1)
train1.add_carriage(passenger1)
train1.speed
puts train1.carriages
train1.remove_carriage(cargo1)
train2 = Train.new(1001, 'cargo')
train2.speed_up(60)
train2.stop
train3 = Train.new(1010, 'passenger')
train3.speed_up(90)
#train3.add_carriage
#train3.remove_carriage
#puts train1.carriages

#puts "Добавление поездов на station1"
station1.add_train(train1)
station1.add_train(train2)
station1.add_train(train3)

#puts "Станции_поезда"
station1.show_trains
station1.trains_by_type('cargo')
station1.trains_by_type('passenger')
station1.send_train(train2)

#puts "Маршрут"
route1 = Route.new(station1, station2)
route1.add_station(station3)
route1.show_stations
route1.del_station(station3)

route1.add_station(station3)

puts "Назначили маршрут"
train1.set_route(route1)
puts train1.current_station.title

puts "Вперед-назад-вперед-вперед"
train1.forward
puts train1.current_station.title
train1.back
puts train1.current_station.title
train1.forward
puts train1.current_station.title
train1.forward
puts train1.current_station.title

