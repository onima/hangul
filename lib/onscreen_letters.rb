class OnscreenLetters
  include Enumerable

  attr_reader :letters

  def initialize
    @letters = []
  end

  def retrieve_letter(user_guess)
    letters.find(-> { FakeLetter.new }) { |l| l.image.x >= 0 && l.image.y >= 0 && (user_guess == l.initial || user_guess == l.final) }
  end

  def delete(letter)
    @letters.delete(letter)
  end

  def clear
    @letters.clear
  end

  def <<(letter)
    @letters << letter
  end

  def each(&block)
    @letters.each do |letter|
      block.call(letter)
    end
  end
end
