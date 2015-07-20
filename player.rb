#name your character
#start out with one item of choice?
#other attributes that affect your fights/obstacles positively and negatively

class Player
	attr_accessor :hp, :ap, :x, :y

	MAX_HP = 100

	def initialize
		@hp = MAX_HP
		@ap = 1
		@x, @y = 0, 0
	end

	def alive?
		@hp > 0
	end

	def hurt(amount)
		@hp -= amount
	end

	def heal(amount)
		@hp += amount
		@hp = [@hp, MAX_HP].min
	end

	def print_status
		puts "*" * 80
		puts "HP: #{@hp}/#{MAX_HP}"
		puts "AP: #{@ap}"
		puts "*" * 80
	end

	def name_char(name)
		puts "What is your name?\n>>"
		name = gets.chomp.capitalize
		puts "Your name is #{name}"
	end
	
end

