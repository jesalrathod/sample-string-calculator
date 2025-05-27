# spec/string_calculator_spec.rb
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'with valid inputs' do
      it 'returns 0 for an empty string' do
        expect(calculator.add('')).to eq(0)
      end

      it 'returns the number for a single number' do
        expect(calculator.add('1')).to eq(1)
      end

      it 'returns the sum of two numbers' do
        expect(calculator.add('1,2')).to eq(3)
      end

      it 'handles multiple numbers' do
        expect(calculator.add('1,2,3,4,5')).to eq(15)
      end

      it 'ignores non-numeric characters except minus sign' do
        expect(calculator.add('1a,2b;3\n4')).to eq(10)
      end

      it 'handles spaces between numbers' do
        expect(calculator.add('1, 2, 3')).to eq(6)
      end
    end

    context 'with invalid inputs' do
      it 'raises ArgumentError when input is not a string' do
        expect { calculator.add(123) }.to raise_error(ArgumentError, "Input must be a string")
      end

      it 'raises ArgumentError when no valid numbers are found' do
        expect { calculator.add('a,b,c') }.to raise_error(ArgumentError, "No valid numbers found")
      end

      it 'raises ArgumentError when negative numbers are present' do
        expect { calculator.add('1,-2,3,-4') }
          .to raise_error(ArgumentError, "negative numbers not allowed: -2, -4")
      end
    end

    context 'with edge cases' do
      it 'handles single-character non-numeric input' do
        expect { calculator.add('a') }.to raise_error(ArgumentError, "No valid numbers found")
      end

      it 'handles string with only delimiters' do
        expect { calculator.add(',,,') }.to raise_error(ArgumentError, "No valid numbers found")
      end

      it 'handles mixed valid and invalid inputs' do
        expect(calculator.add('1,a,2')).to eq(3)
      end

      it 'handles string with only spaces' do
        expect { calculator.add('   ') }.to raise_error(ArgumentError, "No valid numbers found")
      end
    end
  end
end