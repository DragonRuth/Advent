
records =  File.read('input.txt').split("\n").map{ |line| line.split(/:/)[1].split.join.to_i }
print (0..records[0]).to_a.map{|t| t*(records[0]-t)}.filter{|d| d > records[1]}.count()
