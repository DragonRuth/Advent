print File.read('input.txt').split("\n").map{ |line| line.gsub(/[^0-9]/, '').chars}.map{ |array| (array.first + array.last).to_i}.sum()
