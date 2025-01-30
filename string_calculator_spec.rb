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
  end
end