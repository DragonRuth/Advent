require 'matrix'

def get_valid_coordinates( row, col)
    return [[row + 1,col], [row - 1, col], [row +1, col +1], [row+1, col -1], [row, col -1], [row, col + 1], [row -1, col+ 1], [row - 1, col - 1]]
end

matrix = Matrix[*File.read('input.txt').split("\n").map{ |line| line.chars }]
valid_coordinates = []
matrix.each_with_index do |e, row, col|
   if e =~ /\*/
      valid_coordinates << {"gear" => [row,col], "adjacent" => get_valid_coordinates(row, col)}
   end
end

def get_adjacent_gears(row, number_coodinates, valid_coordinates)
   valid_coordinates.select{|gear| number_coodinates.any?{ |col| gear["adjacent"].include? [row,col] }}.map{ |gear| gear["gear"]}
end

print File.read('input.txt').split("\n").each_with_index.map{ |line, row| [row, line.chars.filter_map.with_index { |elem, index| [index, elem] if elem  =~ /\d/ }.slice_when{ |prev, curr| curr[0] != prev[0].next }.to_a.map{ |number_array|  number_array.inject(['', []]){ |res, digit|  [res[0] + digit[1], res[1] + [digit[0]]  ] }  }]}.map{ |row| row[1].map{ |number, coodinates| [number, get_adjacent_gears(row[0], coodinates, valid_coordinates)] }.select{ |number, gears| gears.any? }}.flatten(1).group_by{|number, coordinates| coordinates}.values.select{|numbers| numbers.count() == 2}.map{|number_group| number_group.inject(1){|res, numbers| res * numbers[0].to_i }}.sum()
