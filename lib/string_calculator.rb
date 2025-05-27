class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers.gsub(/[^0-9\-,]/, ',').split(',').map(&:strip).reject(&:empty?).map(&:to_i).sum
  end
end

calculator = StringCalculator.new

print "Please input string (press Enter when done): "

input = gets.chomp

result = calculator.add(input)

puts "Result: #{result}"