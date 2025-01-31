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

    context 'when given numbers separated by commas and newlines' do
      it 'returns their sum' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end
  end
end