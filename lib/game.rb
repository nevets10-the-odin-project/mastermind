class Game
  attr_accessor :code, :current_turn, :board

  MAX_TURNS = 12
  COLOR_ARRAY = %w[R O Y G B P]

  def initialize
    self.code = []
    self.current_turn = 1
    self.board = init_board
  end

  def init_board
    row = Array.new(6, 'X')
    Array.new(12, row)
  end

  def start_game
    self.code = generate_code
    self.current_turn = 1
    self.board = init_board

    p code
    start_turn while current_turn <= MAX_TURNS
  end

  def generate_code
    rng = Random.new
    new_code = []

    6.times do
      new_code << COLOR_ARRAY[rng.rand(0..5)]
    end

    new_code
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
