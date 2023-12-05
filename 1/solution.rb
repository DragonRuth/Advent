#A part: change to last(1)
puts File.read('input.txt').split("\n").chunk{ |elf| elf != ""}.map{ |even, a| a}.map{|a| a.map{|e| e.to_i }.sum()}.sort().last(3).sum()
