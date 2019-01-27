#2. Заполнить массив числами от 10 до 100 с шагом 5

#arr = (10..100).map { |number| puts number if number % 5 == 0 } 
#=> возвращает nil'ы, надо разобраться

#arr = []
#(10..100).step(5) { |number| arr << number }

arr = (10..100).step(5).to_a
puts arr
