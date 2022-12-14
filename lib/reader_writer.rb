require './lib/braille_converter'
class ReaderWriter
  attr_reader :input, :output, :message_data, :message_length
  def initialize(input, output)
    @braille_converter = BrailleConverter.new
    @input = input
    @output = output
    @message_data = File.readlines(@input).map {|str| str.chomp}
    @message_length = 0
  end


  # def file_length
  #   @message_data.map {|str| str.length}.sum
  # end

  # def braille_to_str(braille)
  #   strings = ['', '', '']
  #   strings.each_with_index do |str, i|
  #     braille.each do |char|
  #       str << "#{char[i]} "
  #     end
  #     str.chop!
  #   end
  #   strings
  # end

  def braille_to_str(braille)
    Array.new(3).map.with_index {|str, i| braille.map {|char| char[i]}.join(' ')}
  end

  def str_to_braille(strings)
    split_str = strings.map {|str| str.split}
    split_str[0].map.with_index {|n, i| [split_str[0][i], split_str[1][i], split_str[2][i]]}
  end

  def write_braille
    file = File.open(@output, 'w+')
    @message_data.each do |line|
      @message_length += line.chomp.length
      while line.length > 0 do
        braille_text = @braille_converter.convert_to_braille(line.slice!(0..39))
        braille_to_str(braille_text).each {|str| file.write "#{str}\n"}
      end
    end
    file.close
  end

  def write_english
    file = File.open(@output, 'w+')
    while @message_data.length > 0 do
      english = @braille_converter.convert_to_english(str_to_braille(@message_data.shift(3)))
      @message_length += english.length
      file.write  english + "\n"
    end
  end
end
