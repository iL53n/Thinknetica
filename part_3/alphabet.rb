#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = Hash.new(0)
number = 1

('a'..'z').each do |letter|
	alphabet[letter] = number
	number += 1
end

puts alphabet
