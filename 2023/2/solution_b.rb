print File.read('input.txt').split("\n").map{ |line| line.scan(/(\d+ green|\d+ red|\d+ blue)/).flatten.map{ |cubes| cubes.split }.group_by{ |pull| pull[1] }.values.map{ |color| [color.inject(0){ |min, n| n[0].to_i > min ?  n[0].to_i : min }, color[0][1]] }.inject(1) { |product, n| product * n[0] }}.sum()
