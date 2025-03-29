class MasterMind
  COLORS = ['🔴', '🔵', '🟢', '🟡', '🟠', '🟣', '⚫', '⚪']
  EXACT_MATCH = '⚫'
  COLOR_MATCH = '⚪'


  attr_accessor :board, :player1, :player2, :guess
  attr_reader :hidden_code, :number_of_players
  def initialize
    @board = Board.new
    @number_of_players = UI.get_number_of_players
    @player1 = Player.new(UI.get_name)
    @player2 = @number_of_players == 1 ? Player.new : Player.new(UI.get_name)
  end

  def play
    turns = 12
    UI.show_instructions
    hidden_code = number_of_players == 1 ? COLORS.sample(5) : UI.select_hidden_code
 
    while (turns > 0)
      guess = UI.select
      board.grid[1] = guess
      UI.show_board(board)
      break
      turns -= 1
    end
  end

  private
  
end
