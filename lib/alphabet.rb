require 'yaml'

class Alphabet
  attr_reader :letters

  def initialize
    @letters = set_letters
  end

  def sample
    letter = letters.sample
    Letter.new(name: letter.name, initial: letter.initial, final: letter.final)
  end

  private

  def set_letters
    YAML.load_file('./letters.yml').fetch('letters').map do |name, options|
      Letter.new(name: name, initial: options.fetch('initial'), final: options.fetch('final'))
    end
  end
end