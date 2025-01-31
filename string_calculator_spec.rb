require './string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'when given an empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when the string contains numbers' do
      it 'returns the sum of the numbers' do
        calculator = StringCalculator.new
        expect(calculator.add('1,2,3')).to eq(6)
      end
    end

    context 'when given single number' do
      it 'returns that number' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'when input ends with a comma followed by a newline' do
      it 'raises an "input is invalid" exception' do
        expect { calculator.add("1,\n") }.to raise_error('input is invalid')
      end
    end

    context 'when given custom delimiter' do
      it 'returns sum of the numbers separated by the custom delimiter' do
        calculator = StringCalculator.new
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when given numbers separated by commas and newlines' do
      it 'returns their sum' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when the string contains a different delimiter' do
      it 'handles a custom single-character delimiter' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when given negative numbers' do
      it 'raises an exception' do
        calculator = StringCalculator.new
        expect { calculator.add('1,-2,-3') }.to raise_error('negative numbers not allowed: -2, -3')
      end
    end

    context 'when negative numbers are used' do
      it 'raises an exception' do
        expect { calculator.add('1, -2') }.to raise_error(RuntimeError, 'negative numbers not allowed: -2')
      end
    end
  end
end