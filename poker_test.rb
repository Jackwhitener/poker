require "minitest/autorun"
require_relative "poker.rb"
class Test < Minitest::Test
    def test_1
        assert_equal(1,1)
    end
    def test_card_number
        possiblenumbers = (1..52).to_a
        cardnum = randomcard(1)
        assert_equal(true, possiblenumbers.include?(cardnum[0]))
    end
    def test_multiple_cards
        possiblenumbers = (1..52).to_a
        cardnum = randomcard(2)
        assert_equal(true, possiblenumbers.include?(cardnum[0]))
        assert_equal(true, possiblenumbers.include?(cardnum[1]))
        assert_equal(false, cardnum[1] == cardnum[0])
    end
    def test_for_whole_deck
        possiblenumbers = (1..52).to_a
        cardnum = randomcard(52)
        # puts cardnum
        assert_equal(true,52 == cardnum.length)
    end
    def test_for_nonstandard_datatype
        possiblenumbers = (1..52).to_a
        cardnum = randomcard("apples")
        assert_equal(["stobbit"],cardnum)
    end
    # def test_for_card_namer
    #     assert_equal("Two of Clubs (1)", cardnamer(1))
    # end
    # def test_hand_namer
    #     assert_equal(["Two of Clubs (1)", "Three of Clubs (5)", "Four of Clubs (9)", "Five of Clubs (13)", "Six of Clubs (17)"], handname([1,5,9,13,17]))
    # end
    def test_drawtwohands
        twohands = drawtwohands
        assert_equal(true, twohands.length == 2)
    end
end