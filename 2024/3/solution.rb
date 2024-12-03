print File.read('input.txt').scan(/mul\((\d+),(\d+)\)/).map{|pair| pair.map{|a| a.to_i}.inject(:*)}.sum()
