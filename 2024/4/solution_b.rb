require 'matrix'

def check_cross(row,col,mtrx,a)
  col >=  mtrx.column_count - 1 || row >= mtrx.row_count - 1 || col == 0 || row == 0 ? false : mtrx[row - 1, col - 1] == a[0] &&  mtrx[row - 1, col + 1] == a[1] &&  mtrx[row + 1, col + 1] == a[2] &&  mtrx[row + 1, col - 1] == a[3]
end

def check_xmas(mtrx, row, col)
    ["M","S","S","M"].permutation.to_a.uniq.select{|arr| arr.join.match(/MM|SS/)}.any?{|a| check_cross(row,col,mtrx,a)}
end

matrix = Matrix[*File.read('input.txt').split("\n").map{ |line| line.chars }]
print matrix.each_with_index.map{|e, row, col| e == "A" ? (check_xmas(matrix, row, col) ? 1 : 0) : 0}.sum()
