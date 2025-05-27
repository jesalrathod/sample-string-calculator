class StringCalculator
  def add(numbers)
    raise ArgumentError, "Input must be a string" unless numbers.is_a?(String)
    return 0 if numbers.empty?
    parsed_numbers = begin
                       numbers.gsub(/[^0-9\-,]/, ',')
                              .split(',')
                              .map(&:strip)
                              .reject(&:empty?)
                              .map(&:to_i)
                     rescue
                       raise ArgumentError, "Invalid input format"
                     end

    raise ArgumentError, "No valid numbers found" if parsed_numbers.empty?

    negatives = parsed_numbers.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}"
    end

    parsed_numbers.sum
  end
end

calculator = StringCalculator.new

print "Please input string (press Enter when done): "

input = gets.chomp

begin
  result = calculator.add(input)
  puts "Result: #{result}"
rescue ArgumentError => e
  puts "Error: #{e.message}"
end