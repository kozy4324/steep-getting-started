# rbs_inline: enabled

class Object
  #: (untyped up_to) -> untyped
  def numbers(up_to)
    (1...up_to).to_a
  end

  #: (untyped numbers) -> untyped
  def only_multiples_of_3_or_5(numbers)
    numbers.map { |n| n % 3 == 0 || n % 5 == 0 ? n : 0 }
  end

  #: (untyped numbers) -> untyped
  def sum_up(numbers)
    numbers.reduce(0) { |sum, it| sum + it }
  end
end

puts sum_up only_multiples_of_3_or_5 numbers 1000
