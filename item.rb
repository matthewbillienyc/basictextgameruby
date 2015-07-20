#keys, monster dropped items, items you can combine

class Item
	TYPES = [:potion, :sword]

	attr_accessor :TYPES

	def initialize
		@type = TYPES.sample
	end

	def interact(player)
		case @type
		when :potion
			puts "You pick up #{self}."
			player.heal(10)
		when :sword
			puts "You pick up #{self}."
			player.ap += 1
		end
	end

	def to_s
		"Sweet, you found an awesome #{@type.to_s}!"
	end

end

