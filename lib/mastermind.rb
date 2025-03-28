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
    hidden_code = number_of_players == 1 ? COLORS.sample(5) : UI.select
 
    while (turns > 0)
      
      turns -= 1
    end
  end
end
