class Game
  attr_accessor :current_turn
  attr_reader :turns

  TURNS = 11

  def start
    self.current_turn = 0
  end
end
