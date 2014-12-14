class Player
  def play_turn(warrior)

  @turn ||= 1
  @health ||= warrior.health

  if warrior.feel.empty?
    if (warrior.health >= @health) && (warrior.health < 16)
      warrior.rest!
    else
      warrior.walk!
    end
  else
    if warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end
  end
  
  @health = warrior.health
  @turn = @turn + 1
  
  end
end
  
