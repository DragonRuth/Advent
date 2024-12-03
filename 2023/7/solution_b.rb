cr = { "A" => "14", "K" => "13", "Q" => "12", "J"=> "01", "T"=> "10", "9"=>"09", "8"=>"08", "7" => "07", "6" => "06", "5" => "05", "4"=> "04", "3"=> "03", "2"=>"02", "1"=>"01" }

def get_rank(card)
    count = card.chars.group_by(&:capitalize).map {|k,v| [k, v.length]}.sort_by{|k| k[1]}.reverse()
    wildcard = card.count("J")
    if count[0][1] == 2 and count[1][1] == 2 and count[0][0] != "J" and count[1][0] != "J"
        return  2.5 + wildcard
    end
    if count[0][1] == 3 and count[1][1] == 2  and count[0][0] != "J" and count[1][0] != "J"
        return  3.5
    end
    return count[0][0] == "J"  ? count[0][1] + (count.count() > 1 ? count[1][1] : 0) : wildcard > 2 ? count[1][1] + wildcard : count[0][1] + wildcard
end

print File.read('input.txt').split("\n").map{ |line|  [line.split()[0], get_rank(line.split()[0]), line.split()[1].to_i] }.group_by{|card, rank, bet| rank}.sort.to_h.values.map{|rank_set| rank_set.sort_by{ |card, rank, bet| card.chars.map{ |c| cr[c]}.join.to_i  }}.flatten(1).each_with_index.map{| c, i| c[2] * (i +1)}.sum()
