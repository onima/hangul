class Letter

  attr_reader :name, :image, :boom

  def initialize(name:)
    @name = name
    @image = letter_graphics.name(name: name)
    @boom = letter_graphics.boom
    @exploded = false
  end

  def move_letter
    image.y += 1
    boom.y += 1
  end

  def explode
    boom.play && image.remove
    @exploded = true
    self
  end

  def exploded?
    @exploded
  end

  private

  def letter_graphics
    @letter_graphics ||= Graphics::Letter.new(width: Random.new.rand(100..1100))
  end
end