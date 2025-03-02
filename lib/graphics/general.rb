module Graphics
  class General

    def remove_all
      landscape.remove
      score_title.remove
      score.remove
      game_over.remove
      restart.remove
    end

    def landscape
      @landscape ||=
        Image.new('assets/images/south_korea_flag.png', width: 1200, height: 800, opacity: 0.2)
    end

    def score_title
      @score_title ||=
        Text.new(
          'Score',
          x: 25, y: 25,
          size: 30,
          color: 'black',
        )
    end

    def score
      @score ||=
        Text.new(
         '0',
         x: 55, y: 65,
         size: 40,
         color: 'red',
        )
    end

    def game_over
      @game_over ||=
        Text.new(
          'Game Over',
          x: 450, y: 380,
          size: 50,
          color: 'black',
        )
    end

    def restart
      @restart ||=
        Text.new(
          'Press return to restart game',
          x: 400, y: 500,
          size: 30,
          color: 'black',
        )
    end
  end
end
