class TicTacToe
  def initialize
  @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS=[
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6],
      ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
  index = user_input.to_i - 1
  end

  def move(index, player)
  @board[index] = player
  end

  def position_taken?(location)
  @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count do |token|
      token == "X" || token == "O"
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[1]] == @board[win_combo[2]] &&
      position_taken?(win_combo[0])
    end
  end

  def full?
  @board.all? do |token|
    token == "X" || token == "O"
    end
  end

  def draw?
  !won? && full?
  end

  def over?
  won? || draw? || full?
  end

  def winner
  if winning_token = won?
  @board[winning_token[0]]
  end
  end

  def play
    until over?
      turn
      end
        if won?
          puts "Congratulations #{winner}!"
          else draw?
            puts "Cat's Game!"
            end
      end

end
