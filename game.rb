#prompts, error messages with wrong commands, help system
#save system
#parse input for case, etc


Dir["**.*"].each { |f| require_relative f }

class Game
	ACTIONS = [
		:north, :east, :south, :west, :look, :fight, :take, :status
	]

	def initialize
		@world = World.new
		@player = Player.new

		start_game
	end

	private

	def start_game
		while @player.alive?
			@current_room = @world.get_room(@player)

			@player.name_char

			print_status

			action = take_player_input
			next unless ACTIONS.include? action

			take_action(action)
		end
	end

	def take_player_input
		print "What's the plan?"
		gets.chomp.to_sym
	end

	def print_status
		puts "You are at map position [#{@player.x}, #{@player.y}]."

		puts @current_room
		if @current_room.content
			puts "You see #{@current_room.content}."
		end
	end

	def take_action(action)
		case action
		when :look
			print_status
		when :north
			@world.move_n(@player)
		when :south
			@world.move_s(@player)
		when :east
			@world.move_e(@player)
		when :west 
			@world.move_w(@player)
		when :fight, :take
			@current_room.interact(@player)
		when :status
			@player.print_status
		end
	end
end

Game.new