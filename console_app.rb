require_relative "poker_oob.rb"
redhand = Hand.new(nil)
blackhand = Hand.new(nil)
deck = Deck.new
deck.cards_in_deck = deck.shufflecards
redhand.draw(deck, 5)
blackhand.draw(deck, 5)
redhandlated = handslator(redhand.cards_in_hand)
blackhandlated = handslator(blackhand.cards_in_hand)
scoreblack = scoreboy(handjudger(blackhand))
scorered = scoreboy(handjudger(redhand))
puts "Black hand: #{blackhandlated[0]}, #{blackhandlated[1]}, #{blackhandlated[2]}, #{blackhandlated[3]}, #{blackhandlated[4]}, #{handjudger(blackhand)}"
puts "Red hand: #{redhandlated[0]}, #{redhandlated[1]}, #{redhandlated[2]}, #{redhandlated[3]}, #{redhandlated[4]}, #{handjudger(redhand)}"
if scoreblack > scorered
    puts "Black hand wins!"
elsif scorered > scoreblack
    puts "Red hand wins!"
else
    tiebroken = tiebreaker(redhand,blackhand)
    if tiebroken == nil
        puts"Unbreakable tie!"
    else
        puts tiebroken
    end
end