require 'ruby2d'
require 'yaml'
require 'pry'
require_relative 'lib/letter'

set title: 'Hangul', background: 'white', width: 1200, height: 800

Image.new('assets/images/south_korea_flag.png', width: 1200, height: 800, opacity: 0.2)
Text.new(
    'Score',
    x: 25, y: 25,
    size: 30,
    color: 'black',
)

@score =
  Text.new(
    '0',
    x: 55, y: 65,
    size: 40,
    color: 'red',
  )

letters = YAML.load_file('letters.yml').fetch('letters')

alphabet =
    letters.map do |name, options|
      Letter.new(name: name, initial: options.fetch('initial'), final: options.fetch('final'))
    end

tick = 0

@running_letters = []

update do
  if tick % 240 == 0
    letter = alphabet.sample
    @running_letters << Letter.new(name: letter.name, initial: letter.initial, final: letter.final)
  end

  tick += 1

  @running_letters.map do |l|
    l.image.y += 1
    l.boom.y += 1
  end
end

@user_guess = ''

on :key_down do |event|
  @user_guess << event.key if ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '/'].include?(event.key)

  if event.key == 'return'
    matching_letter = @running_letters.find { |letter| letter.image.x >= 0 && letter.image.y >= 0 && (@user_guess == letter.initial || @user_guess == letter.final) }
    if matching_letter
      matching_letter.boom.play
      matching_letter.image.remove
      @running_letters.delete(matching_letter)
      @score.text = (@score.text.to_i + 1).to_s
    end

    @user_guess = ''
  end

  puts event
end

show