class Player
    def play_turn(warrior)
        @warrior = warrior
        
        @turn ||= 1
        if @health.nil?
            @health = warrior.health
        end
        
        if feel_any?
            case
                when feel_enemy? ; warrior.attack!
                when feel_captive? ; warrior.rescue!
                when feel_wall?  ; warrior.pivot!
                else warrior.attack!
            end
            else
            case
                when needs_rest?
                if able_rest?
                    if look_enemy?
                        warrior.shoot!
                        else
                        warrior.rest!
                    end
                    else
                    if warrior.health > 10
                        warrior.walk!
                        else
                        warrior.shoot!
                    end
                end
                else
                warrior.walk!
            end
        end
        
        @health = warrior.health
        @turn = @turn + 1
        
    end
    
    def feel_any?
        !@warrior.feel.empty?
    end
    
    def feel_enemy?
        @warrior.feel.enemy?
    end
    
    def feel_captive?
        @warrior.feel.captive?
    end
    
    def feel_wall?
        @warrior.feel.wall?
    end
    
    def needs_rest?
        @warrior.health < 20
    end
    
    def able_rest?
        @warrior.health >= @health
    end
    
    def look_enemy?
        @warrior.look[2].enemy?
    end
end