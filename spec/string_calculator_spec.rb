require_relative '../string_calculator'

RSpec.describe StringCalculator do
  context 'add numbers in the string' do
    it 'returns 0 when string is blank' do
      obj = StringCalculator.new
      result = obj.add('')
      expect(result).to eq(0)
    end
  end
end