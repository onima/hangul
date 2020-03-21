class GameState

  attr_reader :alphabet, :onscreen_letters
  attr_accessor :score

  def initialize(score:)
    @score = Integer(score)
    @alphabet = Alphabet.new
    @onscreen_letters = OnscreenLetters.new
  end
end