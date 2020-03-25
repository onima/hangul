module Graphics
  class Guess
    class << self
      def to_s
        @guess.text
      end

      def remove_last_letter
        @guess.text = @guess.text[0..-2]
        @guess.remove if @guess
        @guess =
          Text.new(
            @guess&.text || '',
            x: 450, y: 650,
            size: 30,
            color: 'red',
          )
      end

      def input(input)
        @guess.remove if @guess
        @guess =
          Text.new(
            (@guess&.text || '') << input,
            x: 450, y: 650,
            size: 30,
            color: 'red',
          )
      end

      def clear
        @guess.remove
        @guess.text.clear
      end
    end
  end
end