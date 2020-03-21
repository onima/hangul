require 'ruby2d'

class GameMaster

  def initialize
    setup_general_graphics
    setup_game_state
  end

  def verify_guess(guess:)
    matching_letter = @game_state.onscreen_letters.fetch_potential_matching_letter(guess: guess)
    matching_letter.explode
    update_score if matching_letter.exploded?
    delete_matched_letter(matching_letter)
  end

  def add_new_letter_on_screen
    @game_state.onscreen_letters << @game_state.alphabet.sample
  end

  def move_onscreen_letters
    @game_state.onscreen_letters.each { |l| l.move_letter }
  end

  def when_game_on(&callback)
    callback.call if @game_on
  end

  def when_game_over(&callback)
    if onscreen_letter_overtake_player?
      @game_state.onscreen_letters.clear
      @game_on = false
      @general_graphics.game_over
    end
  end

  private

  def update_score
    @game_state.score += 1
    @general_graphics.score.text = String(@game_state.score)
  end

  def delete_matched_letter(letter)
    @game_state.onscreen_letters.delete(letter)
  end

  def onscreen_letter_overtake_player?
    @game_state.onscreen_letters.any? { |l| l.image.y > 800 }
  end

  def setup_general_graphics
    @general_graphics = Graphics::General.new
    @general_graphics.landscape
    @general_graphics.score_title
    @general_graphics.score
  end

  def setup_game_state
    @game_state = GameState.new(score: @general_graphics.score.text)
    @game_on = true
  end
end