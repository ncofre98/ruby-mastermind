class Board
  attr_accessor :feedback_grid, :selection_grid

  def initialize
    @feedback_grid = Array.new(12) { Array.new(4, MasterMind::EMPTY) }
    @selection_grid = Array.new(12) { Array.new(4, MasterMind::EMPTY) }
  end

  def to_s
    feedback_grid.each_with_index.reduce("") do |output, (row, index)|
      output << "#{row_to_s(row)} "
      output << "#{row_to_s(selection_grid[index])}\n"
    end
  end

  def row_to_s(row)
    row.each.reduce("") do |output, (square)|
      output << "#{square} "
    end
  end
end
