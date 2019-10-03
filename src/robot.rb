class Robot
  attr_reader :map, :location

  DIRECTION_RULES = {
    'N' => { axis: :y, change: 1, to_left: 'W' },
    'E' => { axis: :x, change: 1, to_left: 'N' },
    'S' => { axis: :y, change: -1, to_left: 'E' },
    'W' => { axis: :x, change: -1, to_left: 'S' }
  }.freeze

  def initialize(map, location, direction_rules = DIRECTION_RULES)
    @map = map
    @location = location
    @direction_rules = direction_rules
  end

  def move(directions)
    return forward if directions === 'F'
    return turn_left if directions === 'L'
  end

  private

  def current_rules
    @direction_rules[@location[:direction]]
  end

  def forward
    @location[current_rules[:axis]] += current_rules[:change]
  end

  def turn_left
    @location[:direction] = current_rules[:to_left]
  end
end
