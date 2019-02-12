def randomcard(amount)
    cards = (1..52).to_a
    drawncards = Array.new
    amount.times do
        card = cards.sample
        cards.delete_at(card)
        drawncards << card
    end
puts drawncards
return drawncards
end