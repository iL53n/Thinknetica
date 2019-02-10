# begin
#   puts 'before'
#   Math.sqrt(-1)
#   puts 'after'
# rescue Exception => e
#   # puts "Exception: #{e.inspect}"
#   puts "Exception: #{e.message}"
#   puts e.backtrace
#   raise
# end

# puts 'after after'
# ---
# def method_with_error
#   #...
#   raise ArgumentError, "boom"
# end

# begin
#   method_with_error
# rescue RuntimeError => e
#   puts e.inspect
#   puts "oh no!!!!"
# end
# ---
# def sqrt(value)
#   sqrt = Math.sqrt(value)
#   puts sqrt
# rescue StandardError
#   puts "Неверное значение"
# end

# sqrt(-1)
# ---
# def connect_to_wiki
#   #...
#   raise "Connection error"
# end

# i = 0
# begin
#   connect_to_wiki
# rescue RuntimeError
#   i += 1
#   puts "Check your internet connection!"
#   retry if i < 3
# ensure
#   puts "There was #{i} attempt"
# end

#Car
NUMBER_FORMAT = /^[а-яА-Я]{1}\d{3}[а-яА-Я]{2}$/ #Ы343Цц
#если i после / - не чувств к регистру
def valid?
  validate!
  true # возвращаем true, если метод validate! не выбросил исключение
rescue
  false # возвращаем false, если было исключение
end

protected
def validate!
  raise "Номер не может быть пустым" if number.nil?
  raise "Номер не может быть меньше 6 символов" if number.length < 6
  raise "Формат не соответствует" if nimber !~ NUMBER_FORMAT
end


