class MasterMind
  COLORS = ['🔴', '🔵', '🟢', '🟡', '🟠', '🟣']
  EXACT_MATCH = '⚫'
  COLOR_MATCH = '⚪'
  EMPTY = '➖'


  attr_accessor :board, :player1, :player2, :guess
  attr_reader :hidden_code, :number_of_players
  def initialize
    @board = Board.new
    @number_of_players = UI.get_number_of_players
    @player1 = Player.new(UI.get_name)
    @player2 = @number_of_players == 1 ? Player.new : Player.new(UI.get_name)
  end

  def play
    moves = 0
    winner = false
    UI.show_instructions
    hidden_code = number_of_players == 1 ? COLORS.sample(5) : UI.select_hidden_code
 
    while (moves < 12 && !winner)
      guess = UI.select
      board.feedback_grid[moves] = feedback(guess, hidden_code)
      board.selection_grid[moves] = guess
      UI.show_board(board)
      winner = true if board.selection_grid[moves] == hidden_code
      moves += 1
    end
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
  end
end
