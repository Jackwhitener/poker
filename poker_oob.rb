class Hand
    attr_accessor :cards_in_hand
    def initialize(cards_in_hand)
        if cards_in_hand != nil
            @cards_in_hand = cards_in_hand
        else
            @cards_in_hand = []
        end
    end
    def draw(deckdrawnfrom, cardnum)
        cardnum.times do
            cards_in_hand << deckdrawnfrom.cards_in_deck[-1]
            deckdrawnfrom.cards_in_deck.delete_at(deckdrawnfrom.cards_in_deck[-1])
        end
    end
end
class Deck 
    attr_accessor :cards_in_deck
    def initialize
        cards_in_deck = (1..52).to_a
        @cards_in_deck = cards_in_deck
    end
    def shufflecards
       return cards_in_deck.shuffle
    end
end
def handjudger(hand)
    # card_values = {
    #     twos => [1,2,3,4],
    #     threes => [5,6,7,8],
    #     fours => [9,10,11,12],
    #     fives => [13,14,15,16],
    #     sixes => [17,18,19,20],
    #     sevens => [21,22,23,24],
    #     eights => [25,26,27,28],
    #     nines => [29,30,31,32],
    #     tens => [33,34,35,36],
    #     jacks => [37,38,39,40],
    #     queens => [41,42,43,44],
    #     kings => [45,46,47,48],
    #     aces => [49,50,51,52],
    # }
    paircount = 0
    pairs = [[1,2], [1,3], [1,4], [2,3], [2,4], [3,4], [5,6], [5,7], [5,8], [6,7], [6,8], [7,8], [9,10], [9,11], [9,12], [10,11], [10,12], [11,12], [13,14], [13,15], [13,16], [14,15], [14,16], [15,16], [17,18], [17,19], [17,20], [18,19], [18,20], [19,20], [21,22], [21,23], [21,24], [22, 23], [22,24], [23,24], [25,26], [25,27], [25,28], [26,27], [26, 28], [27,28], [29,30], [29,31], [29, 32], [30,31], [30, 32], [31,32], [33,34], [33,35], [33,36], [34,35], [34,36], [35,36]]
    pairs.each do |pair|
        if hand.cards_in_hand.include?(pair[0]) && hand.cards_in_hand.include?(pair[1])
            puts "This is pair: #{pair}"
            puts "This is cards_in_hand: #{hand.cards_in_hand}"
            paircount += 1
            puts paircount
        end
    end
    if paircount == 1
        return "Pair"
    elsif paircount == 2
        return "Two Pair"
    end
    if hand.cards_in_hand.include?(52) || hand.cards_in_hand.include?(51) || hand.cards_in_hand.include?(50) || hand.cards_in_hand.include?(49)
        return "Ace High" 
    elsif hand.cards_in_hand.include?(48) || hand.cards_in_hand.include?(47) || hand.cards_in_hand.include?(46) || hand.cards_in_hand.include?(45)
        return "King High"
    elsif hand.cards_in_hand.include?(44) || hand.cards_in_hand.include?(43) || hand.cards_in_hand.include?(42) || hand.cards_in_hand.include?(41)
        return "Queen High"
    elsif hand.cards_in_hand.include?(40) || hand.cards_in_hand.include?(39) || hand.cards_in_hand.include?(38) || hand.cards_in_hand.include?(37)
        return "Jack High" 
    else
        return "Card High"
    end
end