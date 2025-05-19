def numbers(up_to)
  (1...up_to).to_a
end

def only_multiples_of_3_or_5(numbers)
  numbers.map { it % 3 == 0 || it % 5 == 0 ? it : 0 }
end

def sum_up(numbers)
  numbers.reduce(0) { |sum, it| sum + it }
end

puts sum_up only_multiples_of_3_or_5 numbers 1000
