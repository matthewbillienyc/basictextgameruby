class World
	WORLD_WIDTH = 10
	WORLD_HEIGHT = 10

	def initialize
		@rooms = Array.new(WORLD_HEIGHT, Array.new(WORLD_WIDTH))
	end

	def move_n(entity)
		entity.y += 1 if entity.y < WORLD_HEIGHT - 1
	end

	def move_s(entity)
		entity.y -= 1 if entity.y > 0
	end

	def move_e(entity)
		entity.x += 1 if entity.x < WORLD_WIDTH - 1
	end

	def move_w(entity)
		entity.x -= 1 if entity.x > 0
	end

	def get_room(entity)
		@rooms[entity.x][entity.y] ||= Room.new
	end
end

