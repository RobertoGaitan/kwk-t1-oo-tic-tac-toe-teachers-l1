class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      current_token = current_player
      move(index, current_token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    counter = 0
    counter = turn_count
    counter % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |position_1, position_2, position_3|
        if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X"
          return [position_1, position_2, position_3]
          break
        end
        if @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
            return [position_1, position_2, position_3]
            break
        end
    end
    return false
  end
  
  def full?
    @board.each do |token|
      if token == " " || token == ""
         return false
         break
       end
   end
  return true
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end
  
  def winner
   if won?
      winning_token = won?
      winneris = @board[winning_token[0]]
      return winneris
    end
  end
  
def play
    while !over? do
      turn
    end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end
end



