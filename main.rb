require 'ruby2d'
require 'pry'
require_relative 'lib/models/letter'
require_relative 'lib/models/alphabet'
require_relative 'lib/models/fake_letter'
require_relative 'lib/models/game_master'
require_relative 'lib/models/game_state'
require_relative 'lib/models/onscreen_letters'
require_relative 'lib/graphics/general'
require_relative 'lib/graphics/letter'

set title: 'Hangul', background: 'white', width: 1200, height: 800

##
# Game logic
##

game_master = GameMaster.new
user_guess = ''

##
# Event handling
##

ALPHABET_INPUT = -> (i) { "abcdefghijklmnopqrstuvwxyz".split('').include?(i) }
RETURN_INPUT = -> (i) { i == 'return' }

on :key_down do |event|
  game_master.when_game_on do
    case event.key
    when ALPHABET_INPUT then user_guess << event.key
    when RETURN_INPUT
      game_master.verify_guess(guess: user_guess)
      user_guess = ''
    end
  end

  game_master.when_game_over do
    case event.key
    when RETURN_INPUT then game_master.restart_game
    end
    puts event
  end
end

##
# Game loop
##

tick = 0
update do
  game_master.when_game_on do
    game_master.add_new_letter_on_screen if tick % 240 == 0
    game_master.move_onscreen_letters
    tick += 1
    game_master.game_over if game_master.onscreen_letter_overtake_player?
  end

  game_master.when_game_over do
  end
end

show