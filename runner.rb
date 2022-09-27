require './lib/reader_writer'
night_writer = ReaderWriter.new(ARGV[0],ARGV[1])
night_writer.read_file
puts "Created '#{ARGV[1]}' containing #{night_writer.file_length} characters."
