require_relative "poker_oob.rb"
redhand = Hand.new(nil)
blackhand = Hand.new(nil)
deck = Deck.new
deck.cards_in_deck = deck.shufflecards
redhand.draw(deck, 5)
blackhand.draw(deck, 5)
puts "Black hand: #{blackhand.cards_in_hand}, #{handjudger(blackhand)}"
puts "Red hand: #{redhand.cards_in_hand}, #{handjudger(redhand)}"