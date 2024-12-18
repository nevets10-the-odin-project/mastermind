class Game
  attr_accessor :code, :current_turn

  MAX_TURNS = 12
  COLOR_ARRAY = %w[R O Y G B P]

  def initialize
    self.code = []
    self.current_turn = 1
  end

  def start_game
    self.code = []
    self.current_turn = 1
    generate_code

    p code
    start_turn while current_turn <= MAX_TURNS
  end

  def generate_code
    rng = Random.new
    self.code = []

    6.times do
      code << COLOR_ARRAY[rng.rand(0..5)]
    end
  end

  def correct_code?(guess)
    code == guess.upcase.split
  end

  def start_turn
    puts "Turn #{current_turn} of 12"
    puts "What's the code?"
    puts correct_code?(gets.chomp)
    self.current_turn += 1
  end
end
