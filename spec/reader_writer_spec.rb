require './lib/reader_writer'
require './lib/braille_dictionary'

describe ReaderWriter do
  before(:each) do
    @dictionary = BrailleDictionary.new
    @reader_writer = ReaderWriter.new('./docs/dummy_message.txt', './docs/dummy_braille.txt')
  end

  describe '#initialize' do
    it 'initializes program with the following files' do
      expect(@reader_writer).to be_an_instance_of ReaderWriter
      expect(@reader_writer.input).to eq './docs/dummy_message.txt'
      expect(@reader_writer.output).to eq './docs/dummy_braille.txt'
    end
  end

  describe '#read_file' do
    it 'reads text from file and stores it in an array of strings' do
      expect(@reader_writer.read_file).to eq ['Sphinx of', 'black quartz', 'judge my vow']
    end
  end

  describe '#write_braille' do
    it 'writes text from array of strings to file' do
      @reader_writer.read_file
      @reader_writer.write_braille
      expect(File.exist?(@reader_writer.output)).to eq true
    end
  end

  describe '#write_english' do
    it 'writes text from array of strings to file' do
      @reader_writer.read_file
      @reader_writer.write_english
      expect(File.exist?(@reader_writer.output)).to eq true
    end
  end

  describe '#braille_to_str' do
    it 'takes braille chars and stitches them into an array of 3 strings' do
      expect(@reader_writer.braille_to_str([@dictionary.dictionary['a']])).to eq ['0.','..','..']
      expect(@reader_writer.braille_to_str([@dictionary.dictionary['a'],@dictionary.dictionary['b']])).to eq ['0. 0.','.. 0.','.. ..']
    end
  end

  describe '#str_to_braille' do
    it 'takes an array of 3 strings and splits them into braille chars' do
      expect(@reader_writer.str_to_braille(['0.','..','..'])).to eq [@dictionary.dictionary['a']]
      expect(@reader_writer.str_to_braille(['0. 0.','.. 0.','.. ..'])).to eq [@dictionary.dictionary['a'], @dictionary.dictionary['b']]
    end
  end
end
