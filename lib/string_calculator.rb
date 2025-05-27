class StringCalculator
  def add(number)
    return 0 if number.empty?
    number.to_i
  end
end

calculator = StringCalculator.new

print "Please input string (press Enter when done): "

input = gets.chomp

result = calculator.add(input)

puts "Result: #{result}"