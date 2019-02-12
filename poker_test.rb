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
end