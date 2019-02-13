class Hand
    attr_accessor :cards_in_hand
    def initialize(cards_in_hand)
        @cards_in_hand = cards_in_hand
    end
end
class Deck
    attr_accessor :cards_in_deck
    def initialize(cards_in_deck)
        @cards_in_deck = cards_in_deck
    end
    def shufflecards
       return cards_in_deck.shuffle
    end
end
