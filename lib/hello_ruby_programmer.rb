def greeting(name)
    puts "Hi, #{name}! Welcome to the wonderful world of Ruby programming."
end

puts "Enter your name"
name = gets.strip
greeting(name)
