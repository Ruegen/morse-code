# This is a basic morse code converter, which takes user input and outputs the word in english and morse code to a table.
# The win32/sound gem can be used to generate the morse code sounds, with a dash defined as three times the length of a dot. This functionality is not yet working.
# Also wanted to loop the code to add to the table.

require 'terminal-table/import'
require 'win32/sound'
include Win32

# Create a hash holding the alphabet and morse code as key value pairs.

morse = {
	"a" => ".-",
	"b" => "-...",
	"c" => "-.-.",
	"d" => "-..",
	"e" => ".",
	"f" => "..-.",
	"g" => "--.",
	"h" => "....",
	"i" => "..",
	"j" => ".---",
	"k" => "-.-",
	"l" => ".-..",
	"m" => "--",
	"n" => "-.",
	"o" => "---",
	"p" => ".--.",
	"q" => "--.-",
	"r" => ".-.",
	"s" => "...",
	"t" => "-",
	"u" => "..-",
	"v" => "...-",
	"w" => ".--",
	"x" => "-..-",
	"y" => "-.--",
	"z" => "--..",
	" " => " ",
	"1" => ".----",
	"2" => "..---",
	"3" => "...--",
	"4" => "....-",
	"5" => ".....",
	"6" => "-....",
	"7" => "--...",
	"8" => "---..",
	"9" => "----.",
	"0" => "-----"
}

# Simple terminal interface to get the word to convert as input.

puts "Welcome to the morse code converter."
puts "Please enter your word to convert."
word = gets.chomp.downcase

# Create an array holding each letter of the input.

word_array = word.split("")
morse_word = []
  word_array.each do |letter|
  morse.key(letter)
  morse_word << morse[letter]
  end

# Generate a table for the output.

t = table ['english', 'morse code']
t << [word, morse_word.join("")]

puts t

# This is the sound generator, at the moment I'm having trouble figuring how to separate the morse letters down to the individual dots and dashes - this version only plays the first symbol of each character.

morse_word.each do |a|
	b = a.split("")
	puts b

	if b == "-"
		Sound.beep(3500, 500)
	else
		Sound.beep(3500, 1500)
	end
end
