require './lib/reader_writer'
night_reader = ReaderWriter.new(ARGV[0],ARGV[1])
night_reader.write_english
puts "Created '#{ARGV[1]}' containing #{night_reader.message_length} characters."
