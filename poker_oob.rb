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