require './braille_converter'
class ReaderWriter
  attr_reader :input, :output
  def initialize(input, output)
    @braille_converter = BrailleConverter.new
    @input = input
    @output = output
    @message_data = []
  end


  def file_length
    @message_data.map {|str| str.length}.sum
  end

  def read_file
    @message_data = File.readlines(@input).map {|str| str.chomp}
  end


  def braille_to_str(braille)
    strings = ['', '', '']
    strings.each_with_index do |str, i|
      braille.each do |char|
        str << "#{char[i]} "
      end
      str.chop!
    end
    strings
  end

  def write_file
    @message_data.each do |line|
      braille_text = braille_converter.convert_to_braille(line)
    end
  end
end
