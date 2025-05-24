require_relative '../string_calculator'

RSpec.describe StringCalculator do
  context 'add numbers in the string' do
    it 'returns 0 when string is blank' do
      obj = StringCalculator.new
      result = obj.add('')
      expect(result).to eq(0)
    end

    it 'returns the number as integer when string contains only one number' do 
      obj = StringCalculator.new
      result = obj.add('1')
      expect(result).to eq(1)
    end

    it 'returns the number as integer when string contains only one number but with one or more comma operator' do 
      obj = StringCalculator.new
      result = obj.add('1, , ,   ,')
      expect(result).to eq(1)
    end

    it 'returns the sum of all numbers present in the string and separated by comma' do
      obj = StringCalculator.new
      result = obj.add('10,20')
      expect(result).to eq(30)
    end

    it 'raises an error for one negative number' do
      obj = StringCalculator.new
      expect { obj.add("1,-2,3") }.to raise_error(ArgumentError, "negative numbers not allowed -2")
    end
  end
end