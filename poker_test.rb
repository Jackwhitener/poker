require "minitest/autorun"
require_relative "poker.rb"
class Test < Minitest::Test
    def test_1
        assert_equal(1,1)
    end
    def test_card_number
        possiblenumbers = (1..52)
        cardnum = randomcard(1)
        assert_equal(true, possiblenumbers.include?(cardnum))
    end
end