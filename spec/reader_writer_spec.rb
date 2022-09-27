require './lib/reader_writer'

describe ReaderWriter do
  before(:each) do
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

  describe '#write_file' do
    it 'writes text from array of strings to file' do

    end
  end
end
