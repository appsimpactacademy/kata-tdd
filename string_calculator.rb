# this class will handle the calculation for the given string
class StringCalculator
  def add(string)
    return if string.nil?
    return 0 if string.empty?

    numbers = string.split(',')
    return numbers[0].to_i if numbers.size == 1
  end
end
