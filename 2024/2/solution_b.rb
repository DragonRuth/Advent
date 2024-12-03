def is_safe(sequence)
  sequence.each_cons(2).all? { |a, b| (a <=> b) < 0 && (a-b).abs <= 3 } ||  sequence.each_cons(2).all? { |a, b| (a <=> b) > 0 && (a-b).abs <= 3  }
end

def get_premutations(sequence)
  sequence.map.with_index { |_, i| sequence[0...i] + sequence[(i+1)..-1] }
end
readings = File.read('input.txt').split("\n").map{|line| line.split.map(&:to_i)}
print readings.filter{|r| is_safe(r)}.length  + readings.reject{|r| is_safe(r)}.map{|r| get_premutations(r)}.filter{|rl| rl.any?{|p| is_safe(p)}}.length
