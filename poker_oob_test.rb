require "minitest/autorun"
require_relative "poker_oob.rb"
class Test < Minitest::Test
    def test_1
        assert_equal(1,1)
    end
    def test_for_hand
        hand = Hand.new(nil)
        assert_equal(Hand, hand.class)
    end
    def test_for_cards_in_hand
        hand = Hand.new([1,5,7,9,13])
        assert_equal([1,5,7,9,13], hand.cards_in_hand)
    end
    def test_for_deck
        deck = Deck.new((1..52).to_a)
        assert_equal(Deck, deck.class)
    end
    def test_for_deck_shuffle
        deck = Deck.new((1..52).to_a)
        deck.shuffle
        assert_equal(false, (1..52).to_a == deck.cards_in_deck)
    end
end