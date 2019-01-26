#2. Заполнить массив числами от 10 до 100 с шагом 5

arr = (10..100).map { |number| puts number if number % 5 == 0 }
