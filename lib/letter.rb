class Letter

  attr_reader :image, :romanization
  attr_accessor :boom

  def initialize(name:, romanization:)
    @image = Image.new("assets/images/#{name}.png", width: 50, height: 150, x: 100, y: -250)
    @romanization = romanization
    @boom = Sprite.new(
        'assets/images/boom.png',
        clip_width: 127,
        time: 75,
        x: 65,
        y: -250
    )
  end
end