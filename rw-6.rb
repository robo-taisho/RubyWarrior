class Player
  def play_turn(warrior)

  @turn ||= 1
  if @health.nil?
    @health = warrior.health
  end
  
  if @have_rescued.nil?
    @have_rescued = false
  end

  
  case
  when !@have_rescued
    if warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
      @have_rescued = true
    else
      warrior.walk!(:backward)
    end
  else
    if warrior.feel.empty?
      if warrior.health <20
        if warrior.health < @health
          if warrior.health < 9
            warrior.walk!(:backward)
          else
            warrior.walk!
          end
        else
          warrior.rest!
        end
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
  end

  @health = warrior.health
  @turn = @turn + 1

  end
end
