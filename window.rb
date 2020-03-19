require 'ruby2d'
require_relative 'lib/letter'

set title: 'Hangul', background: 'white', width: 1200, height: 800

Image.new('south_korea_flag.png', width: 1200, height: 800, opacity: 0.2)
letter = Letter.new(name: 'giyeok', romanization: 'g')

update do
  letter.image.y += 2
  letter.boom.y += 2
end

on :key_down do |event|
  if event.key == letter.romanization
    letter.boom.play
    letter.image.remove
  end
end

show