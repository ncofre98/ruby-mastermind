module UI
  def self.select
    puts "Make your choice:"
    MasterMind::COLORS.each_with_index {|color, index| puts "#{color} = #{index}"}
    gets_chomp.to_i
  end

  def self.get_name
    puts "Insert name of player:"
    gets_chomp
  end

  def self.get_number_of_players
    puts "Select number of players (1 - 2):"
    gets_chomp.to_i
  end

  def self.show_board(board)
    puts "Feedback   Selection"
    puts board
  end
end
