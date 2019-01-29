require_relative "./station.rb"   
require_relative "./route.rb"  
require_relative "./train.rb"  

#puts "Станции_создание"
station1 = Station.new('Minsk')
station2 = Station.new('Brest')
station3 = Station.new('Gomel')

#puts "Поезда"
train1 = Train.new(1000, 'cargo', 3)
train1.up_speed(30)
train1.stop
train1.add_carriage
train1.speed
train1.carriages
train2 = Train.new(1001, 'cargo', 6)
train2.up_speed(60)
train2.stop
train2.remove_carriage
train3 = Train.new(1010, 'passenger', 9)
train3.up_speed(90)
train3.add_carriage
train3.remove_carriage

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

