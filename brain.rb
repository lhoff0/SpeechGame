class Brain
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/brain.jpg", true)
    @speed = rand(10)
    reset! 
  end
  
  def update
    if @y > @game_window.height
      reset!
    else
      @y = @y + @speed
    end
  end
  
  def draw
    @icon.draw(@x,@y,20)
  end


  def x
    @x
  end


  def y
    @y
  end


  def reset!
    @y = 0
    @x = rand(@game_window.width)
    @brain
  end
  
  #def pow
    #@icon = Gosu::Image.new(@game_window, "images/pow.jpg", true)
  #end
  
  #def rock
    #@icon = Gosu::Image.new(@game_window, "images/rock.png", true)
  #end
end

