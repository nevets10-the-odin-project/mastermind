class Game
  attr_accessor :code, :current_turn, :board, :win

  MAX_TURNS = 12
  COLOR_ARRAY = %w[R O Y G B P]

  def initialize
    self.code = []
    self.current_turn = 1
    self.board = []
    self.win = false
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
    start_turn while current_turn <= MAX_TURNS && !win
    end_game
  end

  def generate_code
    rng = Random.new
    new_code = []

    4.times do
      new_code << COLOR_ARRAY[rng.rand(0..5)]
    end

    new_code
  end

  def correct_code?(guess)
    code == guess
  end

  def start_turn
    puts "Turn #{current_turn} of 12"
    puts "What's the code?"
    guess = gets.chomp.upcase.split
    give_feedback(guess)
    self.win = correct_code?(guess)
    self.current_turn += 1
  end

  def end_game
    result = win ? 'Won!' : 'Lost.'
    puts "You #{result}"
  end

  def give_feedback(guess)
    filtered_guess = []
    filtered_code = []
    correct = 0
    almost = 0

    guess.each_with_index do |v, i|
      if code[i] == v
        filtered_guess << nil
        filtered_code << nil
        correct += 1
      else
        filtered_guess << v
        filtered_code << code[i]
      end
    end

    filtered_guess.each do |v|
      next if v.nil?

      almost += 1 if filtered_code.include?(v)
    end

    puts "#{correct} correctly placed."
    puts "#{almost} correct colors."
  end
end
