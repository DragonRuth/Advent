@directions = File.open('input.txt', &:gets)[0..-2].chars.map{|c| c == "L" ? 0 : 1}
@mappings = File.read('input.txt').split("\n")[2..-1].map{ |line| Hash[*line.match(/(\w+)\s*=\s*\((\w+), (\w+)\)/).to_a.reverse[0..-2].each_slice(2).to_a.reverse.map{|el| el.count() == 1 ? el[0] : el}]}.reduce({}, :merge!)

def step_until_z(pos)
  step = 0
  cur_pos = pos
  while cur_pos[2] != "Z" do
      cur_pos = @mappings[cur_pos].reverse[@directions[step % @directions.count()]]
      step = step + 1
  end
  return step
end
#for solution 1 just replace @mappings.keys.select{|k| k[2] == "A"} with ["AAA"]
print @mappings.keys.select{|k| k[2] == "A"}.map{|p| step_until_z(p)}.reduce(1, :lcm)
