class Player
  def play_turn(warrior)
    
  @warrior = warrior

  @turn ||= 1
  if @health.nil?
    @health = warrior.health
  end

if feel_wall?
  warrior.pivot!
else
  if warrior.feel.empty?
    case
    when needs_flee?
      warrior.walk!(:backward)
    when needs_assault?
      warrior.walk!
    when able_rest?
      warrior.rest!
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
  
end
