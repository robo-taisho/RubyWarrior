class Player
  def play_turn(warrior)
    
  @warrior = warrior

  @turn ||= 1
  if @health.nil?
    @health = warrior.health
  end


  if warrior.feel.empty?
    case
    when needs_flee?
      warrior.walk!(:backward)
    when needs_assault?
      warrior.walk!
    when able_rest?
      warrior.rest!
    when enemy_there?
      warrior.shoot!
    else 
      warrior.walk!
    end
  else
    case
    when rescue_here?
      warrior.rescue!
    else
      warrior.attack!
    end
  end

@health = warrior.health
@turn = @turn + 1

  end
  
  def feel_wall?
    @warrior.feel.wall?
  end
  
  def under_Attack?
    @warrior.health < @health
  end
  
  def needs_flee?
    @warrior.feel.empty? && under_Attack? && @warrior.health < 9
  end
  
  def needs_assault?
    @warrior.feel.empty? && under_Attack? && @warrior.health >= 9
  end
  
  def able_rest?
    !under_Attack? && @warrior.health < 20
  end
  
  def enemy_there?
    return true if !@warrior.look[1].captive?  && (@warrior.look[1].enemy? || @warrior.look[2].enemy?)
  end
  
  def rescue_here?
    @warrior.feel.captive?
  end

end
