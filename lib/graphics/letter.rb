module Graphics
  class Letter

    def initialize(width:)
      @width = width
    end

    def name(name:)
      Image.new("assets/images/#{name}.png", width: 55, height: 55, x: @width, y: -250)
    end

    def boom
      Sprite.new(
        'assets/images/boom.png',
        clip_width: 127,
        time: 75,
        x: @width - 40,
        y: -270
      )
    end
  end
end