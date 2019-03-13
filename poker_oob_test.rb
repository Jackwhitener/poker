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
    def test_for_hand_judger_high
        hand = Hand.new([51,1,14,5,19])
        assert_equal("Ace High", handjudger(hand))
        hand1 = Hand.new([1,14,5,19,47])
        assert_equal("King High", handjudger(hand1))
        hand2 = Hand.new([9,17,22,33,43])
        assert_equal("Queen High", handjudger(hand2))
        hand3 = Hand.new([1,6,11,17,39])
        assert_equal("Jack High", handjudger(hand3) )
        hand4 = Hand.new([1,6,15,30,32])
        assert_equal("Card High", handjudger(hand4))
    end
    def test_for_hand_judger_pair
        hand = Hand.new([1,2])
        assert_equal("Pair", handjudger(hand))
        hand1 = Hand.new([1,2,7,6])
        assert_equal("Two Pair", handjudger(hand1))
    end
    def test_for_hand_judger_toak
        hand = Hand.new([1,2,3])
        assert_equal("Three of a Kind", handjudger(hand))
        hand1 = Hand.new([1,2,3,0])
        assert_equal("Four of a Kind", handjudger(hand1))
    end
    def test_for_hand_judger_straight
        hand = Hand.new([0,5,10,15,17])
        assert_equal("Straight", handjudger(hand))
        hand1 = Hand.new([11,16,21,36,27])
        assert_equal("Straight", handjudger(hand))
    end
    def test_for_hand_judger_flush
        hand = Hand.new([0,4,12,20,44])
        assert_equal("Flush", handjudger(hand))
    end
    def test_for_hand_judger_fullhouse
        hand = Hand.new([13,14,15,9,10])
        assert_equal("Full House", handjudger(hand))
    end 
    def test_for_hand_judger_straightflush
        hand = Hand.new([4,8,12,16,20])
        assert_equal("Straight Flush", handjudger(hand))
    end
    def test_for_hand_judger_royalflush
        hand = Hand.new([32,36,40,44,48])
        assert_equal("Royal Flush", handjudger(hand))
    end
    def test_for_score_boy
        hand = Hand.new([1,6,15,30,32])
        score = handjudger(hand)
        assert_equal(0,scoreboy(score))
        hand1 = Hand.new([1,6,11,17,39])
        score1 = handjudger(hand1)
        assert_equal(1,scoreboy(score1))
        hand2 = Hand.new([9,17,22,33,43])
        score2 = handjudger(hand2)
        assert_equal(2,scoreboy(score2))
        hand3 = Hand.new([1,14,5,19,47])
        score3 = handjudger(hand3)
        assert_equal(3, scoreboy(score3))
        hand4 = Hand.new([51,1,14,5,19])
        score4 = handjudger(hand4)
        assert_equal(4, scoreboy(score4))
        hand5 = Hand.new([1,2])
        score5 = handjudger(hand5)
        assert_equal(5, scoreboy(score5))
        hand6 = Hand.new([1,2,7,6])
        score6 = handjudger(hand6)
        assert_equal(6, scoreboy(score6))
        hand7 = Hand.new([1,2,3])
        score7 = handjudger(hand7)
        assert_equal(7,scoreboy(score7))
        hand8 = Hand.new([0,5,10,15,17])
        score8 = handjudger(hand8)
        assert_equal(8, scoreboy(score8))
        hand9 = Hand.new([0,4,12,20,44])
        score9 = handjudger(hand9)
        assert_equal(9,scoreboy(score9))
    end
end