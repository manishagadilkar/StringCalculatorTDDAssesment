class StringCalculator
  def add(numbers)
    # Return 0 for empty strings
    return 0 if numbers.empty?

    # Sum the numbers and return the result
    integer_digits.sum
  end

  private

  def validate_and_convert(digits)
    # Convert to integer and check for negatives
    negative_numbers = []
    integer_digits = digits.map do |digit|
      raise 'input is invalid' if digit.strip.empty?

      number = Integer(digit)
      negative_numbers << number if number.negative?
      number
    end

    # Raise an exception if there are negative numbers
    raise "negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    integer_digits
  end
end

# Example usage:
# calculator = StringCalculator.new
# puts calculator.add('')          # Should output 0
# puts calculator.add('1,5')       # Should output 6
# puts calculator.add('1')         # Should output 1