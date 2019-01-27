#3. Заполнить массив числами фибоначчи до 100

next_num = 0
fib_arr = [0, 1]

loop do
  next_num = fib_arr[-1] + fib_arr[-2]
  break if next_num > 100
  fib_arr << next_num
end

puts fib_arr
