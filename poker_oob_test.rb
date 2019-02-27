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
        deck = Deck.new
        assert_equal(Deck, deck.class)
    end
    def test_for_deck_length
        deck = Deck.new
        assert_equal(52, deck.cards_in_deck.length)
    end
    def test_for_deck_shuffle
        deck = Deck.new
        deck.cards_in_deck = deck.shufflecards
        assert_equal(false, (1..52).to_a == deck.cards_in_deck)
    end
    def test_for_draw
        deck = Deck.new
        hand = Hand.new(nil)
        hand.draw(deck.cards_in_deck)
        assert_equal(5, hand.cards_in_hand.length)
    end
end