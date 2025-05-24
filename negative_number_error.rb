class NegativeNumberError < StandardError
  def initialize(negatives)
    super("negative numbers not allowed #{negatives.join(',')}")
  end
end
