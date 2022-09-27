require './lib/braille_dictionary'
class BrailleConverter
  attr_reader :braille_dictionary
  def initialize
    @braille_dictionary = BrailleDictionary.new
  end

  def convert_to_braille(str)
    str.downcase.chars.map {|char| @braille_dictionary.dictionary[char]}
  end
end
