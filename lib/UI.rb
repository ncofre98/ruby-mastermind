module UI
  def self.select
    puts "Make your choice:"
    show_options
    gets.chomp.to_i
  end

  def self.select_hidden_code
    puts "Insert your hidden code:"
    show_options
    gets.chomp
  end

  def self.show_instructions
    puts <<~INSTRUCTIONS
    🎯 **Goal of the Game:**  
    Discover the secret code before running out of your 12 attempts.  

    🔥 **How to Play:**  
    - Enter 5 numbers, one for each colored ball.  
    - Each number corresponds to a specific color.  

    🛠️ **Color Options:***
    INSTRUCTIONS

    show_options

    puts <<~EXAMPLE
    ✅ **Example:**  
    If you enter: `01234`  
    You'll see: 🔴🔵🟢🟡🟠  

    Good luck! 🍀
    EXAMPLE
  end

  def self.show_options
    puts MasterMind::COLORS.map.with_index {|color, index| "#{color} = #{index}"}.join(' ')
  end

  def self.get_name
    puts "Insert name of player:"
    gets.chomp
  end

  def self.get_number_of_players
    puts "Select number of players (1 - 2):"
    gets.chomp.to_i
  end

  def self.show_board(board)
    puts "Feedback   Selection"
    puts board
  end
end
