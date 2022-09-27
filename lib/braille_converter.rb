require './lib/braille_dictionary'
class BrailleConverter < BrailleDictionary

  def convert_to_braille(str)
    str.downcase.chars.map {|char| dictionary[char]}
  end
end
