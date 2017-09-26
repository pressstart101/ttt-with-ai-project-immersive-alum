require 'pry'
class Board
  attr_accessor :cells, :player


  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(position)
    cells[position.to_i-1]
  end

  def full?
    cells.none? {|x| x == " "}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
    # counter = 0
    # cells.each do |x| 
    #   if x != " " 
    #     counter += 1
    #   end
    # end
    # counter
  end

  def taken?(position)
    cells[position.to_i-1] != " " ? true :false
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
    # binding.pry
  end



end
