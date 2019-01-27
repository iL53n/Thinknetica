=begin
5. 
Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
Найти порядковый номер даты, начиная отсчет с начала года. 
Учесть, что год может быть високосным. 
(Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) 
Алгоритм опредления високосного года: www.adm.yar.ru
=end

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

=begin
Год високосный, если он делится на четыре без остатка, н
о если он делится на 100 без остатка, это не високосный год. 
Однако, если он делится без остатка на 400, это високосный год. 
if year % 4 == 0 - високосный
if year % 100 == 0 - не високосный
if year % 400 == 0 - високосный
=end

day = 0
month = 0
year = 0

loop do
  print "Введите число: "
  day = gets.to_i
  break if day.between?(1, 31)
  puts "ERROR! Введено не корректное число!"
end

loop do
  print "Введите месяц: "
  month = gets.to_i
  #month_pos = month - 1 #позиция указанного месяца в массиве
  break if month.between?(1, 12)
  puts "ERROR! Введен не корректный номер месяца!"
end

loop do
  print "Введите год: "
  year = gets.to_i
  break if year > 0
  puts "ERROR! Введено не корректное значение года!"
end

#months[1] = 29 if year % 4 == 0 || year % 400 == 0
leap_year = year % 4 == 0 && year % 100 != 0 || year % 400 == 0
months[1] += 1 if leap_year

#date_number = 0
#months[month_pos] = day
#months[0..month_pos].each { |day_month| date_number += day_month }

date_number = day + months.take(month - 1).reduce(0, :+)
puts "Дата #{day}-#{month}-#{year} имеет порядоковый номер: #{date_number}"
