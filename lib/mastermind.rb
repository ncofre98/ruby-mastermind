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
    hidden_code = mode == 1 ? COLORS.sample(5) : UI.select_hidden_code

    while (moves < 12)
      last_feedback = moves == 0 ? nil : board.feedback_grid[moves - 1]
      guess = mode == 1 ? UI.select : cpu_guess(last_feedback, hidden_code)
      board.selection_grid[moves] = guess
      board.feedback_grid[moves] = feedback(guess, hidden_code)
      UI.show_board(board)
      break if board.selection_grid[moves] == hidden_code
      moves += 1
    end
 
    winner = board.selection_grid == hidden_code ? player1 : player2
    UI.show_results(winner)
  end

  private
  def feedback(guess, hidden_code)
    guess.map.with_index do |ball, index|
      if ball == hidden_code[index]
        EXACT_MATCH
      elsif hidden_code.include?(ball)
        COLOR_MATCH
      else
        EMPTY
      end
    end
    #.shuffle # To avoid giving positional hints
  end

  #Knuth Algorithm
  def cpu_guess(feedback, hidden_code)
    if !@possible_solutions || !@last_guess
      @possible_solutions = COLORS.repeated_permutation(5).to_a
      @last_guess = ['🔴', '🔴', '🔵', '🔵', '🟢'] #First guess
    else
      @possible_solutions.select! do |code|
        feedback(code, @last_guess) == feedback(@last_guess, hidden_code)
      end
      @last_guess = @possible_solutions.first || COLORS.sample(5)
    end
    @last_guess
  end
end
