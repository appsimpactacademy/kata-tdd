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
  end
end