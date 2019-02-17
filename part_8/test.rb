
require_relative './station.rb'
require_relative './route.rb'  
require_relative './train.rb'
require_relative './carriage.rb'
require_relative './passenger_carriage.rb' 
require_relative './passenger_train.rb' 
require_relative './cargo_carriage.rb'
require_relative './cargo_train.rb'   
require_relative './railway.rb'   

Railway.new.run

puts 'Пасс_вагон'
pass_car =  PassengerCarriage.new(10)
pass_car.take_capacity
puts 'Свободно'
puts pass_car.available_capacity
puts 'Занято'
puts pass_car.occupied_capacity
puts pass_car.inspect

puts 'Груз_вагон'
cargo_car = CargoCarriage.new(15)
cargo_car.take_capacity(7)
puts 'Свободно'
puts cargo_car.available_capacity
puts 'Занято'
puts cargo_car.occupied_capacity
puts cargo_car.inspect
