puts File.read('input.txt').split("\n").map{|pair| pair.split(",").map{|rng| rng.split("-")}.map{ |a| (a[0]..a[1]).to_a}}.select{|pair| ((pair[0] & pair[1]).length == pair[0].length) || ((pair[0] & pair[1]).length == pair[1].length)}.length