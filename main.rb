require 'ruby2d'
require 'pry'
require_relative 'lib/letter'
require_relative 'lib/alphabet'
require_relative 'lib/fake_letter'
require_relative 'lib/game_master'
require_relative 'lib/game_state'
require_relative 'lib/onscreen_letters'
require_relative 'lib/graphics/landscape'
require_relative 'lib/graphics/score'

set title: 'Hangul', background: 'white', width: 1200, height: 800

game_master = GameMaster.new.setup_game!
game_state = game_master.game_state
onscreen_letters = OnscreenLetters.new
@user_guess = ''

##
# Event handling
##

ALPHABET_INPUT = -> (i) { ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'].include?(i) }
RETURN_INPUT = -> (i) { i == 'return' }

on :key_down do |event|
  case event.key
  when ALPHABET_INPUT
    @user_guess << event.key
  when RETURN_INPUT
    game_master.execute_guess(user_guess: @user_guess, onscreen_letters: onscreen_letters)

    @user_guess = ''
  else
    @user_guess
  end

  puts event
end

##
# Game loop
##

tick = 0
game_over = false
update do
  if !game_over
    if tick % 240 == 0
      onscreen_letters << game_state.alphabet.sample
    end

    tick += 1

    onscreen_letters.map do |l|
      l.image.y += 1
      l.boom.y += 1
    end
  end

  if onscreen_letters.any? { |l| l.image.y > 800 }
    onscreen_letters.clear
    game_over = true
    Text.new(
      'Game Over',
      x: 450, y: 380,
      size: 50,
      color: 'black',
    )
  end
end

show