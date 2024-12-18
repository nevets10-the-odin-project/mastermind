class Game
  attr_accessor :code, :current_turn

  MAX_TURNS = 11
  COLOR_ARRAY = %w[R O Y G B P]

  def initialize
    self.code = []
  end

  def start
    self.current_turn = 0
  end

  def generate_code
    rng = Random.new
    self.code = []

    6.times do
      code << COLOR_ARRAY[rng.rand(0..5)]
    end

    p code
  end
end
