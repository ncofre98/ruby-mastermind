class MasterMind
  COLORS = ['🔴', '🔵', '🟢', '🟡', '🟠', '🟣']
  EXACT_MATCH = '⚫'
  COLOR_MATCH = '⚪'
  EMPTY = '➖'

  attr_accessor :board, :player1, :player2
  def initialize
    @board = Board.new
    @player1 = Player.new(UI.get_name)
    @player2 = Player.new
  end

  def play
    moves = 0
    UI.show_instructions
    mode = UI.select_mode
    hidden_code = mode == 1 ? COLORS.sample(4) : UI.select_hidden_code

    while (moves < 12)
      last_feedback = moves == 0 ? nil : board.feedback_grid[moves - 1]
      guess = mode == 1 ? UI.select : cpu_guess(last_feedback, hidden_code)
      board.selection_grid[moves] = guess
      board.feedback_grid[moves] = feedback(guess, hidden_code)
      UI.show_board(board)
      break if board.selection_grid[moves] == hidden_code
      moves += 1
    end

    if board.selection_grid[moves] == hidden_code
      winner = mode == 1 ? player1 : player2
    else
      puts "Game over! The code was #{hidden_code}"
      winner = mode == 1 ? player2 : player1
    end
    UI.show_results(winner)
  end

  private
  def feedback(guess, hidden_code)
    guess_dup = guess.dup
    hidden_code_dup = hidden_code.dup
    result = []

    guess_dup.each_with_index do |color, i|
      if color == hidden_code_dup[i]
        result << EXACT_MATCH
        guess_dup[i] = hidden_code_dup[i] = nil
      end
    end
    guess_dup.compact!
    hidden_code_dup.compact!
    
    guess_dup.each do |color|
      if i = hidden_code_dup.index(color)
        result << COLOR_MATCH
        hidden_code_dup[i] = nil
      else
        result << EMPTY
      end
    end
    result.sort_by { %w[⚫ ⚪ ➖].index(_1) }
  end

  def cpu_guess(last_feedback, hidden_code)
    if !@possible_solutions || !@last_guess
      @possible_solutions = COLORS.repeated_permutation(4).to_a
      @last_guess = ['🔴', '🔴', '🔵', '🔵'] #First guess
    else
      @possible_solutions.select! do |code|
        feedback(code, @last_guess) == last_feedback
      end
      @last_guess = @possible_solutions.first || COLORS.sample(4)
    end
    @last_guess
  end
end
