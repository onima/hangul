require 'yaml'

class Alphabet
  attr_reader :letters

  def initialize
    @letters = YAML.load_file('./letters.yml').fetch('letters').map { |_, v| Letter.new(name: v) }
  end

  def sample
    Letter.new(name: letters.sample.name)
  end
end