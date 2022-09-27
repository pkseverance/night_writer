require './lib/reader_writer'
require './lib/braille_dictionary'

describe BrailleConverter do
  before(:each) do
    @braille_converter = BrailleConverter.new
    @braille_dictionary = BrailleDictionary.new
    @en_US_text = 'Test'
    @braille_text = [
      @braille_dictionary.dictionary['t'],
      @braille_dictionary.dictionary['e'],
      @braille_dictionary.dictionary['s'],
      @braille_dictionary.dictionary['t']
    ]
  end

  it 'exists' do
    expect(@braille_converter).to be_an_instance_of BrailleConverter
  end

  describe '#convert_to_brail' do
    expect(@braille_converter.convert_to_brail(@en_US_text)).to eq @braille_text
  end
end
