@initial_set = File.read('input.txt').split("\n").map{ |line| line.split(/Card|:|\|/).map{| array| array.split.map(&:to_i) }.reject{ |a| a.empty? }}

def calculate_cards(card)
    won_points = card[2].inject(0){ |res, n| card[1].include?(n) ? res + 1 : res }
    if won_points == 0
       return 1
    end
    extra_cards = @initial_set[(card[0][0])..(card[0][0] - 1 + won_points)].reject { |c| c.empty? || c.nil? }
    return extra_cards.inject(1){|res,card| res + calculate_cards(card)}
end

print @initial_set.map{ |card| calculate_cards(card)}.sum()
