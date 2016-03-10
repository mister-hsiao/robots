WEIGHT_CAPACITY = 250
DEFAULT_ATTACK = 5

class Robot
  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon

  def initialize
    @health = 100
    @equipped_weapon = nil
    @position = [0,0]
    @items = []
  end

  ### ACTIONS
  # Movement Actions
  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  # Item-related Actions
  def pick_up(item)
    @equipped_weapon = item if item.is_a? Weapon
    @items << item if items_weight + item.weight <= WEIGHT_CAPACITY
  end

  def items_weight
    total_weight = @items.inject(0) { |sum, item| sum + item.weight }
  end

  # Health-related Actions
  def wound(points)
    @health -= points
    @health = 0 if @health < 0
  end

  def heal(points)
    @health += points
    @health = 100 if @health > 100
  end

  # Robot-related Actions
  def attack(other_robot)
    @equipped_weapon == nil ? other_robot.wound(DEFAULT_ATTACK) : @equipped_weapon.hit(other_robot)      
  end

  # Weapon-related Actions

end