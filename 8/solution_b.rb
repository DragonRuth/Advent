require "matrix"
forest = Matrix[*File.read('input.txt').split("\n").map{|row| row.chars }]
c = forest.each_with_index.to_a
k = c.collect do |e, row, col|
        top = forest.column(col).to_a.first(row).reverse
        top_block = top.find_index{|t| t >= e }
        top_score = top_block ? top.first(top_block).length + 1 : top.length
        puts e.to_s + " " + row.to_s + " " + col.to_s
        puts "top" + " " + top.join  + " " + (top_block.to_s || "")  + " " + top_score.to_s 
    
        down = forest.column(col).to_a.drop(row + 1)
        down_block = down.find_index{|t| t >= e}
        down_score = down_block ? down.first(down_block).length + 1 : down.length
        puts "down" + " " + down.join  + " " + (down_block.to_s || "")  + " " + down_score.to_s 
    
        left = forest.row(row).to_a.first(col).reverse
        left_block = left.find_index{|t| t >= e}
        left_score = left_block ? left.first(left_block).length + 1 : left.length
        puts "left" + " " + left.join  + " " + (left_block.to_s || "")  + " " + left_score.to_s 
    
        right = forest.row(row).to_a.drop(col + 1)
        right_block = right.find_index{|t| t >= e}
        right_score = right_block ? right.first(right_block).length + 1 : right.length
        puts "right" + " " + right.join  + " " + (right_block.to_s || "")  + " " + right_score.to_s 
    
        [e, top_score.to_i,down_score.to_i,left_score.to_i ,right_score.to_i, top_score.to_i * down_score.to_i * left_score.to_i  * right_score.to_i]
end
print k
print k.map{|el| el[5]}.max