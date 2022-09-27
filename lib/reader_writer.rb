class ReaderWriter
  attr_reader :input, :output
  def initialize(input, output)
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
end
