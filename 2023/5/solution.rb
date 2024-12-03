seeds = File.open('input.txt', &:gets).split()[1..-1].map{ |str| str.to_i}
mappings = File.read('input.txt').split("\n").chunk{ |line| line =~ /[\d]/}.map{ |even, a| a}[1..-1].map{ |mapping| mapping.map{ |c| c.split().map{ |str| str.to_i}} }

def get_destinstion(source, mapping)
    dest = mapping.map{ |m| source.between?(m[1],m[1]+m[2]-1) ? m[0] + (source-m[1]) : nil}.reject{|dest| dest.nil?}
    return dest.empty? ? source : dest[0]
end

def follow_mappings(sources, mapping)
   sources.map{|src| get_destinstion(src, mapping)}
end


print mappings.inject(seeds){|sources, mapping| follow_mappings(sources, mapping)}
