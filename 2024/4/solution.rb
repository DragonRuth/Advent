require 'matrix'
follow_dir = lambda {|v,h|
lambda {|row,col,mtrx| row < 3 && v < 0 ||  row >= mtrx.row_count - 3  && v > 0|| col < 3 && h < 0||  col >=  mtrx.column_count - 3 && h > 0  ? false : mtrx[row + v*1, col + h*1]  + mtrx[row + v*2, col + h*2]  + mtrx[row + v*3, col + h*3] == "MAS"}
}

get_count  = lambda {|row,col,mtrx|
    [-1, +1, 0].product([-1, +1, 0]).map{|p| follow_dir.(p[0], p[1])}.count{|f| f.call(row,col,mtrx)}
}

matrix = Matrix[*File.read('input.txt').split("\n").map{ |line| line.chars }]

print matrix.each_with_index.map{|e, row, col| e == "X" ? get_count.call(row, col, matrix) : 0}.sum
