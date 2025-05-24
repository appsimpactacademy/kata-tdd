# this class will handle the calculation for the given string
require_relative 'negative_number_error'
class StringCalculator
  def add(string)
    return if string.nil?
    return 0 if string.empty?

    # following step is required to handle the case if user provided the single quote string
    string = string.gsub('\\n', "\n")
    # remove all non digits from string
    string = string.gsub(/[^0-9\-]+/, ',')

    numbers = string.split(',')
    numbers = numbers.reject { |value| value.strip.empty? }
    numbers = numbers.map(&:to_i)
    numbers = numbers.map {|num| num > 1000 ? 0 : num }
    return numbers[0] if numbers.size == 1

    # filter out the unique negative number
    negatives = numbers.select { |n| n < 0 }.uniq

    # if any negative number present in the given string raise an exception
    raise NegativeNumberError.new(negatives) unless negatives.empty? unless negatives.empty?
    
    numbers.sum
  end
end
