require 'gosu'
require_relative 'player'
require_relative 'rock'

class SpeechGame < Gosu::Window
	def initialize
		super(610, 458, false)
		@superflex = Player.new(self)
		@rock = Rock.new(self)
		@running = true
		@font = Gosu::Font.new(self, Gosu::default_font_name, 30)
		@score = 0
		@background = Gosu::Image.new(self, "images/background.jpg", true)
	end
	
	def update
		if @running
			@score = @score + 1
			if button_down? Gosu::Button::KbLeft
				@superflex.move_left
			end
			
			if button_down? Gosu::Button::KbRight
				@superflex.move_right
			end
			
			if button_down? Gosu::Button::KbUp
				@superflex.move_up
			end
			
			if button_down? Gosu::Button::KbDown
				@superflex.move_down
			end
			
			@rock.update
			#@brains.each {|brain| brain.update}
			
			if @superflex.hit_by? @rock
				stop_game!
			end
				else
				#the game is currently stopped
				if button_down? Gosu::Button::KbEscape
				restart_game
				end
	    end
	end
	
	def draw
		@background.draw(0,0,1)
		@superflex.draw
		@rock.draw
		#@brains.each {|brain| brain.draw}
		@font.draw("The Score is: #{@score}", 20, 20,5)
	end
	
	def stop_game!
		@running = false
		#@rock.each {|rock| rock.pow}
		#@brains.each {|brain| brain.pow}
	end
	
	def restart_game
		@score = 0
		@running = true
		@rock.reset!
		#@brains.each {|brain| brain.reset!}
	end
	
end
	game = SpeechGame.new
	game.show
	
	