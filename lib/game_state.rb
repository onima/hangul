class GameState

  attr_reader :alphabet
  attr_accessor :score

  def initialize
    @score = set_score
    @alphabet = Alphabet.new
  end

  def set_score
   Text.new(
     '0',
     x: 55, y: 65,
     size: 40,
     color: 'red',
   )
  end
end