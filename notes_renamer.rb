#!/usr/bin/ruby -w
if !ARGV[0].nil?
  dirname = ARGV[0]
  files = Dir["#{dirname}/*.txt"]
  files.each do |file_name|
    if !File.directory? file_name
      puts file_name
      file_index = File.basename(file_name)[0..-5]
      File.open(file_name) do |file|
        line = file.readline
        header_text = line[2..line.length-2].gsub("/","-")
        new_file_name = "#{dirname}/#{file_index}-#{header_text}.md"
        puts new_file_name
        File.rename(file_name,new_file_name)
      end
    end
  end
else
  puts "Please provide a directory"
end
