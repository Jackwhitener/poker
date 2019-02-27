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
        hand.draw(deck, 1)
        assert_equal(1, hand.cards_in_hand.length)
    end
    def test_for_multiple_cards
        deck = Deck.new
        hand = Hand.new(nil)
        hand.draw(deck, 5)
        assert_equal(5, hand.cards_in_hand.length)
    end
    def test_for_shuffled_deck
        deck1 = Deck.new
        hand1 = Hand.new(nil)
        deck = Deck.new
        hand = Hand.new(nil)
        hand.draw(deck, 5)
        deck1.shufflecards
        hand1.draw(deck1, 5)
        assert_equal(false, hand1 == hand)
    end
    def test_for_hand_judger
        hand = Hand.new([1,5,11,52,11])
        assert_equal("Ace High", handjudger(hand))
    end
end