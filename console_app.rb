require_relative "poker_oob.rb"
redhand = Hand.new(nil)
blackhand = Hand.new(nil)
deck = Deck.new
deck.cards_in_deck = deck.shufflecards
redhand.draw(deck, 5)
blackhand.draw(deck, 5)
redhandlated = handslator(redhand.cards_in_hand)
blackhandlated = handslator(blackhand.cards_in_hand)
puts "Black hand: #{blackhand.cards_in_hand}, #{blackhandlated}, #{handjudger(blackhand)}"
puts "Red hand: #{redhand.cards_in_hand}, #{redhandlated} #{handjudger(redhand)}"