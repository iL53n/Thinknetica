#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet_vow = {}
vowels = %w[a e i o u y]

('a'..'z').each_with_index do |letter, index|
  alphabet_vow[letter] = index + 1 if vowels.include?(letter)
end

puts alphabet_vow
