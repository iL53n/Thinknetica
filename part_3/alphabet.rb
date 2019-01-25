alphabet = Hash.new
n = 1

('a'..'z').each do |letter|
	alphabet[letter] = n
	n += 1
end

puts alphabet
