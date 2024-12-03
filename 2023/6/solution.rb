
records =  File.read('input.txt').split("\n").map{ |line| line.split(/:/)[1].split.map(&:to_i) }
print records[0].map.with_index{|mt, idx| (0..mt).to_a.map{|t| t*(mt-t)}.filter{|d| d > records[1][idx]}.count()}.inject(:*)
