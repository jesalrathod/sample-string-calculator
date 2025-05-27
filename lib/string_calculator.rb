class StringCalculator
  def add(numbers)
    validate_input_type(numbers)

    return 0 if numbers.empty?

    parsed_numbers = parse_numbers(numbers)
    validate_parsed_numbers(parsed_numbers)
    check_for_negatives(parsed_numbers)

    parsed_numbers.sum
  end

  private

  def validate_input_type(numbers)
    raise ArgumentError, "Input must be a string" unless numbers.is_a?(String)
  end

  def parse_numbers(numbers)
    numbers.gsub(/[^0-9\-,]/, ',')
           .split(',')
           .map(&:strip)
           .reject(&:empty?)
           .map(&:to_i)
  rescue
    raise ArgumentError, "Invalid input format"
  end

  def validate_parsed_numbers(numbers)
    raise ArgumentError, "No valid numbers found" if numbers.empty?
  end

  def check_for_negatives(numbers)
    negatives = numbers.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}"
    end
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