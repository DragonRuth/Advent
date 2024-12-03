require "matrix"
crates = Matrix[*File.read('input.txt').split("\n").first(9).map{|line| line.chars.select.with_index { |_, i| (i + 1) % 4 != 0 }.each_slice(3).to_a.map{ |a| a[1]}}].transpose.to_a.map{ |ar| ar.select{ |e| e != " "  && e.match?(/\D/)}}
File.read('input.txt').split("\n").drop(10).map{ |inst| inst.scan(/\d+/).reverse.map.with_index {|i, idx| i.to_i - ( idx == 2 ? 0 : 1)}}.map.with_index{ |i, idx|  crates[i[0]].unshift(*crates[i[1]].shift(i[2])) }
print crates.map{|a| a.first()}.join