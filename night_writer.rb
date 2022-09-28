require './lib/reader_writer'
night_writer = ReaderWriter.new(ARGV[0],ARGV[1])
night_writer.write_braille
puts "Created '#{ARGV[1]}' containing #{night_writer.message_length} characters."
