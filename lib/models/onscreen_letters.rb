class OnscreenLetters
  include Enumerable

  attr_reader :letters

  def initialize
    @letters = []
  end

  def fetch_potential_matching_letter(guess:)
    letters.find(-> { FakeLetter.new }) { |l| l.image.x >= 0 && l.image.y >= 0 && (guess == l.name) }
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
    @letters.each { |l| block.call(l) }
  end
end
