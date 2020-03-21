class Letter

  attr_reader :name, :image, :initial, :final
  attr_accessor :boom

  def initialize(name:, initial:, final:)
    @width = Random.new.rand(100..1100)
    @name = name
    @image = Image.new("assets/images/#{name}.png", width: 50, height: 50, x: @width, y: -250)
    @initial = initial
    @final = final
    @boom = Sprite.new(
        'assets/images/boom.png',
        clip_width: 127,
        time: 75,
        x: @width - 40,
        y: -270
    )
    @exploded = false
  end

  def explode
    boom.play
    image.remove
    @exploded = true
    self
  end

  def exploded?
    @exploded
  end
end