require "matrix"
forest = Matrix[*File.read('input.txt').split("\n").map{|row| row.chars }]
c = forest.minor(1..-2, 1..-2).each_with_index.collect { |e, row, col|
    (e > forest.column(col + 1).to_a.first(row + 1).max || e > forest.column(col + 1).to_a.drop(row + 2).max || e > forest.row(row + 1).to_a.first(col + 1).max || e > forest.row(row + 1).to_a.drop(col + 2).max) ? e : 0
    }
print c.select{|e| e != 0}.length + 99 + 99 + 97 + 97