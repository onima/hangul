require 'ruby2d'

class GameMaster

  def setup_game!
    setup_graphics
    setup_game_state
    self
  end

  def game_state
    @game_state
  end

  def add_letter_on_screen
    @game_state.onscreen_letters << @game_state.alphabet.sample
  end

  def move_onscreen_letters
    @game_state.onscreen_letters.map do |l|
      l.image.y += 1
      l.boom.y += 1
    end
  end

  def execute_guess(user_guess:)
    matching_letter = @game_state.onscreen_letters.retrieve_letter(user_guess)
    matching_letter.explode
    @game_state.score.text = matching_letter.exploded? ? (@game_state.score.text.to_i + 1).to_s : @game_state.score.text
    @game_state.onscreen_letters.delete(matching_letter)
  end

  private

  def setup_graphics
    Graphics::Landscape.new
    Graphics::Score.new
  end

  def setup_game_state
    @game_state ||= GameState.new
  end
end