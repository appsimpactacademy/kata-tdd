# this class will handle the calculation for the given string
class StringCalculator
  def add(string)
    return if string.nil?
    return 0 if string.empty?

    numbers = string.split(',')
    numbers = numbers.reject { |value| value.strip.empty? }
    return numbers[0].to_i if numbers.size == 1

    numbers = numbers.map(&:to_i)

    # filter out the negative number
    negatives = numbers.select { |n| n < 0 }

    # if any negative number present in the given string raise an exception
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
    end
    numbers.sum
  end
end
