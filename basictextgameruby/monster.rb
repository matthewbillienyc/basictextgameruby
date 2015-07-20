class Monster
	attr_accessor :hp, :ap

	MAX_HP = 10

	def initialize
		@hp = MAX_HP
		@ap = 1
	end

	def alive?
		@hp > 0
	end

	def hurt(amount)
		@hp -= amount
	end

	def to_s
		"A monster! AGHHHGHGHGH!"
	end

	def interact(player)
		while player.alive?
			puts "You hit the monster for #{player.ap} points."
			hurt(player.ap)
			break unless alive?
			player.hurt(@ap)
			puts "The monster hits you for #{@ap}."
		end
	end

end

