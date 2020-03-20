module Graphics
  class Score
    def initialize
      Text.new(
        'Score',
        x: 25, y: 25,
        size: 30,
        color: 'black',
      )
    end
  end
end