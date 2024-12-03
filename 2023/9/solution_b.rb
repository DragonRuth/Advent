def calculate_next(sequence, next_element)
  if sequence.all? {|x| x == 0}
      return 0
  end
  next_element = calculate_next(sequence.each_cons(2).map { |a,b| b-a }, next_element)
  return sequence[0] - next_element
end


@histories = File.read('input.txt').split("\n").map{ |line| line.split().map{ |c| c.to_i  }}.map{|line| calculate_next(line, -1)}.sum()
print @histories
