require './lib/reader_writer'

describe ReaderWriter do
  before(:each) do
    @reader_writer = ReaderWriter.new('message.txt', 'braille.txt')
  end

  describe '#initialize' do
    it 'initializes program with the following files' do
      expect(@reader_writer).to be_an_instance_of ReaderWriter
      expect(@reader_writer.input).to eq 'message.txt'
      expect(@reader_writer.output).to eq 'braille.txt'
    end
  end

  describe '#read_file' do
    it 'reads text from file and stores it in an array of strings' do
      
    end
  end

  describe '#write_file' do
    it 'writes text from array of strings to file' do

    end
  end
end
