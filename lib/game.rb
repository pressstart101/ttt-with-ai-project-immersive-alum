class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
    # Middle row
  # ETC, an array for each win combination
]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board= Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
  @board.turn_count % 2 == 0 ? @player_1 : @player_2
end

def over?
  #   if @board.full?
  #   true
  # end
  won? || draw?
end

def won?
    WIN_COMBINATIONS.find do |x|
      @board.cells[x[0]] == @board.cells[x[1]] &&
      @board.cells[x[1]] == @board.cells[x[2]] &&
      @board.taken?(x[0] + 1)
  end
end

def draw?
  if @board.full? && !won?
    true
  end
end

def winner
  if @x = won?
    board.cells[@x[0]]
  end
end

def turn
  # # puts "Please enter 1-9:"
  # # answer = gets.strip
  # # index = answer.to_i - 1
  # player = current_player
  # current_move = player.move(@board)
  # if !@board.valid_move?(current_move)
  #   turn
  # else
  #   puts "Please enter 1-9:"
  #   @board.turn_count
  #   @board.update(current_move, player)
    
  # #   turn
  # end
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
end


def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

end



end
