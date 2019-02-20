x, y = 1, 2
#
arr = [1, 2, 3]
a, b, c = arr
#
x, y = 1, 2
x, y = y, x #поменять значения
#
||= #или присвоить (если нет значения, присвоить)

#меморизация
def long_method
  sleep(3)
end

def memoization
  @m ||= long_method
end
#двойное отрицание
def has_name? #? в методы если true || false
  !!name 
end
#предикат наоборот
def has_not_name
    !has_name
end
#строковые массивы
%w(apple orange grape)
#
fruits.map(&:upcase) #если есть массив и к каждому применяем...вместо блока можно
#тело метода не более 10(нормально 5)
#вместо case
COLORS = { red: "#f00", blue: "#00f", white: "#fff"}

def code(name)
  @code = COLORS(name) || "#000"
end
#алиасы - один и тотже метода, но с псевдонимом
alias_method :by_name, :code
#переопределить дефолтное поведение(геттеров, сеттеров)
def name=(name)
  @name = name.capitalize
end
#передача хэша
m(a: 1, b: 2)
#передача переменного количетва аргументов
def initialize(number, *args)
  @type = args[0] || "unknown"
  ...
end
#
def initialize(number, options = {})
  @number = number
  @type = options(:type) || "unknown"
  ...
end

#в руби все классы открытые - можем переопределять или расширять классы, в том числе системные

#синглтон метод - возмоность добавить метод к объекту
class << foo
  puts '....'
  end
end

>foo.m

#хороший код
styleguide

rubocop ./
rubocop -a ./











