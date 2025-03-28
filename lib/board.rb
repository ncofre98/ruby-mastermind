class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(24) { Array.new(5, '.') }
  end

  def to_s
    grid.each_with_index.reduce("") do |output, (row, index)|
      output << "\n" if index % 2 == 0 && index != 0
      row.each { |square| output << "#{square} "}
      output << " "
    end
  end
end
