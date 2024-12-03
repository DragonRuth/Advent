require 'matrix'

def get_valid_coordinates( row, col)
    return [[row + 1,col], [row - 1, col], [row +1, col +1], [row+1, col -1], [row, col -1], [row, col + 1], [row -1, col+ 1], [row - 1, col - 1]]
end

matrix = Matrix[*File.read('input.txt').split("\n").map{ |line| line.chars }]
valid_coordinates = []
matrix.each_with_index do |e, row, col|
   if e =~ /[^A-Za-z0-9.]/
      valid_coordinates += get_valid_coordinates(row, col)
   end
end

print File.read('input.txt').split("\n").each_with_index.map{ |line, row| [row, line.chars.filter_map.with_index { |elem, index| [index, elem] if elem  =~ /\d/ }.slice_when{ |prev, curr| curr[0] != prev[0].next }.to_a.map{ |number_array|  number_array.inject(['', []]){ |res, digit|  [res[0] + digit[1], res[1] + [digit[0]]  ] }  }]}.map{ |row| row[1].select{ |number, coodinates| coodinates.any?{ |col| valid_coordinates.include? [row[0],col] } }.map{|number, coordinates| number.to_i}.sum() }.sum()
