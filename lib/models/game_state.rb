class GameState

  attr_reader :alphabet, :onscreen_letters
  attr_accessor :score, :game_on

  def initialize(score:)
    @score = Integer(score)
    @alphabet = Alphabet.new
    @onscreen_letters = OnscreenLetters.new
    @game_on = true
  end
end