seeds = File.open('input.txt', &:gets).split()[1..-1].map{ |str| str.to_i}.each_slice(2).to_a.map{|pair| [pair[0], pair[0]+pair[1]-1]}
mappings = File.read('input.txt').split("\n").chunk{ |line| line =~ /[\d]/}.map{ |even, a| a}[1..-1].map{ |mapping| mapping.map{ |c| c.split().map{ |str| str.to_i}} }

def get_source(dest, mapping)
    source =  mapping.map{ |m| dest.between?(m[0], m[0] + m[2]-1) ? m[1] + (dest - m[0]) : nil}.reject{|src| src.nil?}
    return source.empty? ? dest : source[0]
end

def follow_mappings_backwards(dest, mapping)
    dest.map{|dst| get_source(dst, mapping)}
end

i = 0
while true
    seeds.any?{ |range| mappings.reverse().lazy.inject([i]){|dest, mapping| follow_mappings_backwards(dest, mapping)}[0].between?(range[0], range[1])}  ? break : i = i +1
end
print i
