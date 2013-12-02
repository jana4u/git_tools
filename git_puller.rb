projects.each do |name, path|
  Dir.chdir(path) do
    puts "#{name}:"

    puts `git pull`
  end
end

puts 'All projects updated'
