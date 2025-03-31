module UI
  def self.select
    puts "Make your choice:\n"
    show_options
    transform_to_colors(gets.chomp)
  end

  def self.select_hidden_code
    puts "Insert the hidden code:\n"
    show_options
    transform_to_colors(gets.chomp)
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
    puts "Insert name of player:\n"
    gets.chomp
  end

  def self.get_number_of_players
    puts "Select number of players (1 - 2):\n"
    gets.chomp.to_i
  end

  def self.show_board(board)
    puts "   FEEDBACK       SELECTION"
    puts board
  end

  def self.transform_to_colors(str)
    str.split('').map { |color_index| MasterMind::COLORS[color_index.to_i]}
  end
end
