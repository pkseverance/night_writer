require './lib/braille_dictionary'
class BrailleConverter < BrailleDictionary

  def convert_to_braille(str)
    str.downcase.chars.map {|char| dictionary[char]}
  end

  def convert_to_english(braille)
    braille.map {|char| dictionary.key(char)}.join
  end
end
