class MasterMind
  COLORS = ['🔴', '🔵', '🟢', '🟡', '🟠', '🟣', '⚫', '⚪']
  EXACT_MATCH = '⚫'
  COLOR_MATCH = '⚪'

  attr_accessor :board, :player1, :player2
  def initialize
    @board = Board.new
    @number_of_players = UI.get_number_of_players
    @player1 = Player.new(UI.get_name)
    @player2 = @number_of_players == 2 ? Player.new(UI.get_name) : Player.new 
  end

  def play
  end
end
