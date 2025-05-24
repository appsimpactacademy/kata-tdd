require_relative '../string_calculator'
require_relative '../negative_number_error'

RSpec.describe StringCalculator do
  context 'add numbers in the string' do
    before(:each) do 
      @obj = StringCalculator.new
    end
    
    it 'returns error when string is not given' do
      expect { @obj.add }.to raise_error(ArgumentError, "wrong number of arguments (given 0, expected 1)")
    end

    it 'returns 0 when string is blank' do
      result = @obj.add('')
      expect(result).to eq(0)
    end

    it 'returns the number as integer when string contains only one number' do 
      result = @obj.add('1')
      expect(result).to eq(1)
    end

    it 'returns the number as integer when string contains only one number but with one or more comma operator' do 
      result = @obj.add('1, , ,   ,')
      expect(result).to eq(1)
    end

    it 'returns the sum of all numbers present in the string and separated by comma' do
      result = @obj.add('10,20')
      expect(result).to eq(30)
    end

    it 'raises an error for one negative number' do
      expect { @obj.add("1,-2,3") }.to raise_error(NegativeNumberError, "negative numbers not allowed -2")
    end

    it 'raises an error for multiple negative numbers' do
      expect { @obj.add("-1,-4,2") }.to raise_error(NegativeNumberError, "negative numbers not allowed -1,-4")
    end

    it 'raises an error for multiple negative numbers but only mention the unique negatives' do
      expect { @obj.add("-1,-4,2,-4,5,-1") }.to raise_error(NegativeNumberError, "negative numbers not allowed -1,-4")
    end

    it 'return the sum of numbers when string contains numbers separated by new lines instead of comma and string is a single quoted string' do
      result = @obj.add('1\n2')
      expect(result).to eq(3)
    end

    it 'return the sum of numbers when string contains numbers separated by new lines instead of comma and string is a double quoted string' do
      result = @obj.add("1\n2")
      expect(result).to eq(3)
    end

    it 'return the sum of numbers when string contains numbers separated by new lines and comma and string is a single quoted string' do
      result = @obj.add('1\n2,3')
      expect(result).to eq(6)
    end

    it 'return the sum of numbers when string contains numbers separated by new lines and comma and string is a single quoted string' do
      result = @obj.add("1\n2,3")
      expect(result).to eq(6)
    end

    it 'supports custom delimiters of any length' do
      result = @obj.add("//[*][%]\n1*2%3")
      expect(result).to eq(6)
    end

    it 'raises an error for string containing multiple negative numbers with custom delimiters' do
      expect { @obj.add("//;\n1;2:-3;-5") }.to raise_error(NegativeNumberError, "negative numbers not allowed -3,-5")
    end

    it 'should ignore if the numbers, greater than 1000' do
      result = @obj.add('1,2,1001')
      expect(result).to eq(3)
    end

    it 'should return 0 if string contains only one number and it is greater than 1000' do
      result = @obj.add('1001,')
      expect(result).to eq(0)
    end
  end
end
